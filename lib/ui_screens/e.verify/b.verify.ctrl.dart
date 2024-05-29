part of '_index.dart';

class VerifyCtrl {
  init() => logxx.i(VerifyCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<void> pickFile({bool isVerifyOri = false, bool isVerifyQR = false}) async {
    _dt.rxFilePickedResult.st = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (_dt.rxFilePickedResult.st != null) {
      _dt.rxPickedFile.st = File(_dt.rxFilePickedResult.st!.files.single.path!);
      final fileBytes = await _dt.rxPickedFile.st!.readAsBytes();

      if (isVerifyQR) {
        _dt.rxFilePickedResultNameWatermark.st = _dt.rxFilePickedResult.st!.files.single.name;
        _dt.rxFilePickedResultPathWatermark.st = _dt.rxFilePickedResult.st!.files.single.path!;
        _dt.rxPdfController.st = PdfControllerPinch(
          document: PdfDocument.openData(
            fileBytes,
          ),
        );
      } else {
        _dt.rxFilePickedResultNameOri.st = _dt.rxFilePickedResult.st!.files.single.name;
        _dt.rxFilePickedResultPathOri.st = _dt.rxFilePickedResult.st!.files.single.path!;
        _dt.rxPdfControllerOri.st = PdfControllerPinch(
          document: PdfDocument.openData(
            fileBytes,
          ),
        );
      }
    } else {
      isFileEmpty();
    }
  }

  isFileEmpty() {
    nav.toDialog(
      CupertinoAlertDialog(
        title: const Text('Warning'),
        content: const Text(
          'File has not been selected. please select one pdf file. do you want to continue?',
        ),
        actions: [
          CupertinoDialogAction(
            child: TextButton(
              onPressed: () {
                nav.back();
              },
              child: const Text(
                "Cancel",
              ),
            ),
          ),
          CupertinoDialogAction(
            child: TextButton(
              onPressed: () => pickFile(),
              child: const Text(
                "Yes, please",
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> verifySign({required String qrDataString}) async {
    if (qrDataString.contains('|')) {
      final parts = qrDataString.split('|');
      final signatureBytes = base64Decode(parts[0]);
      final publicKeyBytes = base64Decode(parts[1]);
      final fileBytes = await _dt.rxPickedFile.st!.readAsBytes();

      final pdfBytes = fileBytes;
      final pdfHash = await Sha256().hash(pdfBytes);
      final signature = Signature(
        signatureBytes,
        publicKey: SimplePublicKey(
          publicKeyBytes,
          type: KeyPairType.ed25519,
        ),
      );
      _dt.rxIsSignatureValid.st = await _dt.algorithm
          .verify(
            pdfHash.bytes,
            signature: signature,
          )
          .then(
            (value) => nav.toDialog(
              CupertinoAlertDialog(
                title: const Text('Verification'),
                content: Text(value
                    ? 'Validation completed successfully. The file is verified as your original document.'
                    : 'Validation failed. The file could not be verified as your original document.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      nav.back();
                    },
                    child: const Text('OK'),
                  )
                ],
              ),
            ),
          );
    } else {
      nav.toDialog(
        CupertinoAlertDialog(
          title: const Text('Error'),
          content: const Text('QrCode cannot be verified'),
          actions: [
            TextButton(
              onPressed: () {
                nav.back();
              },
              child: const Text('GOT IT'),
            )
          ],
        ),
      );
    }
  }

  Future<String> convertPDFtoImage(String pdfPath) async {
    final document = await PdfDocument.openFile(pdfPath);
    final outputDir = await getTemporaryDirectory();
    // logx.i('hihihihi');
    final pdfDir = Directory('${outputDir.path}/pdf_images');
    // logx.w(pdfDir.toString());
    // logx.i('wkwkwkwk');

    if (await pdfDir.exists()) {
      await pdfDir.delete(recursive: true);
    }
    // logx.i(pdfPath);

    await pdfDir.create();
    String imagePath = '';
    final page = await document.getPage(1);
    // final height = page.height;
    // final pageImage = await page.render(
    //   width: page.width,
    //   height: page.height,
    //   format: PdfPageImageFormat.png,
    //   // quality: 1080,
    //   cropRect: Rect.fromLTWH(20, height - 70, 60, 60),
    // );

    final ratio = page.width / page.height;
    const pageHeight = 5000.0;
    final pageWidth = ratio * pageHeight;
    const qrSize = pageHeight / 10;

    const marginLeft = qrSize / 10;
    const marginTop = pageHeight - qrSize;

    final pageImage = await page.render(
        width: pageWidth,
        height: pageHeight,
        format: PdfPageImageFormat.png,
        cropRect: const Rect.fromLTWH(marginLeft, marginTop, qrSize, qrSize));

    logx.w('berhasil');
    logx.w('${pageImage?.bytes}');

    final image = img.decodeImage(pageImage!.bytes);
    final file = File('${pdfDir.path}/page_1.png');
    file.writeAsBytesSync(img.encodePng(image!));
    imagePath = file.path;

    await page.close();
    await document.close();
    logx.w('PDF converted to image: $imagePath');

    return imagePath;
  }

  Future<void> imageProcess() async {
    try {
      // final data = await QrCodeToolsPlugin.decodeFrom(_dt.rxQRCodeImage.st!.path);
      // logx.e('$data');
      // final Uint8List data = x.buffer.asUint8List();
      // debugPrint(data.toString());
      // logx.e('${_dt.rxQRCodeBytes.st}');
      _dt.rxPDFImagePath.st = await convertPDFtoImage(_dt.rxFilePickedResultPathWatermark.st);
      // final pdfImageBytes =
      final decoder = QRCodeDartScanDecoder(
        formats: [BarcodeFormat.qrCode],
      );
      // logx.e(_dt.rxQRCodeBytes.st.toString());
      // final ImagePicker picker = ImagePicker();
      // final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      final xfile = XFile(_dt.rxPDFImagePath.st);
      // final xfile = XFile.fromData(data);
      // Result? result = await decoder.decodeFile(pickedFile!);
      Result? result = await decoder.decodeFile(xfile);
      logx.e(result.toString());

      verifySign(qrDataString: result.toString());
    } catch (e) {
      logx.e('Error processing image: $e');
      nav.toDialog(
        CupertinoAlertDialog(
          title: const Text('Error'),
          content: Text('Failed to process the image. Error: $e'),
          actions: [
            CupertinoDialogAction(
              child: TextButton(
                onPressed: () => nav.back(),
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      );
    }
  }
}
