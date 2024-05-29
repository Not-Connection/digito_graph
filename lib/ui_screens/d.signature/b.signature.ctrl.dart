part of '_index.dart';

class SignatureCtrl {
  init() => logxx.i(SignatureCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  // ** function to get new key pair **

  Future<SimpleKeyPair> getNewKeyPair() async => await _dt.algorithm.newKeyPair();

  // ***********************************

  // ** function to get a signature **

  Future<Signature> getSignature(Uint8List bytes) async => await _dt.algorithm.sign(
        bytes,
        keyPair: await getNewKeyPair(),
      );

  // ***********************************

  // ** function for pick a file **

  Future<void> pickFile({bool isVerify = false, bool isVerifyOri = false, bool isVerifyQR = false}) async {
    _dt.rxFilePickedResult.st = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (_dt.rxFilePickedResult.st != null) {
      _dt.rxPickedFile.st = File(_dt.rxFilePickedResult.st!.files.single.path!);
      final fileBytes = await _dt.rxPickedFile.st!.readAsBytes();

      logx.w(_dt.rxPickedFile.st!.path);
      if (isVerify) {
        if (isVerifyOri) {
          _dt.rxPickedPdfFileOri.st = File(_dt.rxPickedFile.st!.path);
          _dt.rxPdfControllerVerifyOri.st = PdfControllerPinch(
            document: PdfDocument.openData(
              fileBytes,
            ),
          );
        } else {
          _dt.rxPickedPdfFileQRCode.st = File(_dt.rxPickedFile.st!.path);

          _dt.rxPdfControllerVerifyQR.st = PdfControllerPinch(
            document: PdfDocument.openData(
              fileBytes,
            ),
          );
        }
      } else {
        _dt.rxPdfController.st = PdfControllerPinch(
          document: PdfDocument.openData(
            fileBytes,
          ),
        );
      }
    } else {
      isFileEmpty();
    }
  }
  // ******************************

  // ** is file not selected then show alert dialog **

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

  // ******************************

  // ** function to create a signature for PDF **

  Future<void> createSignature() async {
    final fileBytes = await _dt.rxPickedFile.st!.readAsBytes();
    final keyPair = await _dt.algorithm.newKeyPair();
    final publicKey = await keyPair.extractPublicKey();

    final pdfBytes = fileBytes;
    final pdfHash = await Sha256().hash(pdfBytes);

    final signature = await _dt.algorithm.sign(
      pdfHash.bytes,
      keyPair: keyPair,
    );

    final signatureBase64 = base64Encode(signature.bytes);
    final publicKeybase64 = base64Encode(publicKey.bytes);
    final qrContent = '$signatureBase64|$publicKeybase64';
    logx.w(qrContent);

    createQRCodeFromSignature(pdfBytes: fileBytes, qrContent: qrContent);
  }

  // ******************************

  // ** function to create a QR Code from Signature **

  createQRCodeFromSignature({
    required Uint8List pdfBytes,
    required String qrContent,
  }) async {
    var imageBytes = QRImage(
      qrContent,
      backgroundColor: img.ColorUint8.rgb(255, 255, 255),
      size: 300,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    ).generate();
    final directory = await getApplicationDocumentsDirectory();
    final fileResult = await File('${directory.path}/qr-${_dt.rxFilePickedResult.st!.files.single.name}.png')
        .writeAsBytes(img.encodePng(imageBytes));

    // final qrImageData = await painter.toImageData(200.0);
    final qrImageBytes = await fileResult.readAsBytes();

    _dt.rxQRCodeBytes.st = qrImageBytes;

    // _dt.rxQRCodeImage.st = await File('${directory.path}/qr.jpg').writeAsBytes(_dt.rxQRCodeBytes.st!);
    // logx.w(_dt.rxQRCodeImage.st!.path);

    final fusion.PdfDocument document = fusion.PdfDocument(
      inputBytes: pdfBytes,
    );

    final Uint8List imageData = qrImageBytes;

    final fusion.PdfBitmap image = fusion.PdfBitmap(imageData);

    final height = document.pages[0].graphics.size.height;

    document.pages[0].graphics.drawImage(image, Rect.fromLTWH(20, height - 70, 60, 60));
    // document.pages[0].graphics.drawImage(image, Rect.fromLTWH(100, 100, 400, 400));

    List<int> bytes = await document.save();

    // final directory = Directory("/storage/emulated/0/Download");
    // final directory = await getApplicationDocumentsDirectory();

    _dt.rxResultPDFwithQRCode.st =
        await File('${directory.path}/${_dt.rxFilePickedResult.st!.files.single.name}-signatured.pdf')
            .writeAsBytes(bytes);
    final elementStringPath = _dt.rxResultPDFwithQRCode.st!.path.split('/');
    _dt.rxResultPDFwithQRCodePath.st = elementStringPath[6];

    final resultPDFBytes = await _dt.rxResultPDFwithQRCode.st!.readAsBytes();

    // _dt.rxPdfController.refresh();

    // _dt.rxPdfController.st = PdfControllerPinch(document: PdfDocument.openData(resultPDFBytes));

    _dt.rxPdfControllerResultPDFWithQRCode.st = PdfControllerPinch(
      document: PdfDocument.openData(
        resultPDFBytes,
      ),
    );
    // document.dispose();

    logx.i('PDF dengan QR code berhasil dibuat dan disimpan.');
    // } else {
    //   logx.e('QR Code doesnt valid');
    // }
  }

  // ******************************

  downloadPDF() async {
    final resultPDFBytes = await _dt.rxResultPDFwithQRCode.st!.readAsBytes();
    // final directory = Directory('/storage/emulated/0/Download/');
    // final uuid = const Uuid().v1();
    // await File('${directory.path}/$uuid.pdf').writeAsBytes(resultPDFBytes).then((value) => logx.i(value.path));

    final directory = Directory('/storage/emulated/0/Download');
    File('${directory.path}/${_dt.rxResultPDFwithQRCodePath.st}').writeAsBytesSync(resultPDFBytes);
  }

  Future<void> shareFile(BuildContext context) async {
    final result = await Share.shareXFiles(
      [XFile(_dt.rxResultPDFwithQRCode.st!.path)],
      text: 'Check this out',
    );

    if (result.status == ShareResultStatus.success) {
      // ignore: use_build_context_synchronously
      _showSnackBar(context, 'Thank you for sharing the picture!');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }

  // ** function to verify signature**

  // Future<void> verifySign({required String qrDataString}) async {
  //   final parts = qrDataString.split('|');
  //   final signatureBytes = base64Decode(parts[0]);
  //   final publicKeyBytes = base64Decode(parts[1]);
  //   final fileBytes = await _dt.rxPickedFile.st!.readAsBytes();

  //   final pdfBytes = fileBytes;
  //   final pdfHash = await Sha256().hash(pdfBytes);
  //   final signature = Signature(
  //     signatureBytes,
  //     publicKey: SimplePublicKey(
  //       publicKeyBytes,
  //       type: KeyPairType.ed25519,
  //     ),
  //   );
  //   _dt.rxIsSignatureValid.st = await _dt.algorithm
  //       .verify(
  //         pdfHash.bytes,
  //         signature: signature,
  //       )
  //       .then(
  //         (value) => nav.toDialog(
  //           CupertinoAlertDialog(
  //             title: const Text('Verification'),
  //             content: Text(value
  //                 ? 'Validation completed successfully. The file is verified as your original document.'
  //                 : 'Validation failed. The file could not be verified as your original document.'),
  //             actions: [
  //               TextButton(
  //                 onPressed: () {
  //                   nav.back();
  //                 },
  //                 child: const Text('OK'),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  // }

  // // ******************************

  // // ** function to convert PDF into an Image **

  // Future<String> convertPDFtoImage(String pdfPath) async {
  //   final document = await PdfDocument.openFile(pdfPath);
  //   final outputDir = await getTemporaryDirectory();
  //   final pdfDir = Directory('${outputDir.path}/pdf_images');

  //   if (await pdfDir.exists()) {
  //     await pdfDir.delete(recursive: true);
  //   }

  //   await pdfDir.create();
  //   String imagePath = '';

  //   final page = await document.getPage(1);
  //   final pageImage = await page.render(
  //     width: page.width,
  //     height: page.height,
  //     format: PdfPageImageFormat.png,
  //   );

  //   final image = img.decodeImage(pageImage!.bytes);
  //   final file = File('${pdfDir.path}/page_1.png');
  //   file.writeAsBytesSync(img.encodePng(image!));
  //   imagePath = file.path;

  //   await page.close();
  //   await document.close();
  //   logx.w('PDF converted to image: $imagePath');

  //   return imagePath;
  // }

  // Future<void> imageProcess() async {
  //   try {
  //     // final data = await QrCodeToolsPlugin.decodeFrom(_dt.rxQRCodeImage.st!.path);
  //     // logx.e('$data');
  //     // final Uint8List data = x.buffer.asUint8List();
  //     // debugPrint(data.toString());
  //     // logx.e('${_dt.rxQRCodeBytes.st}');
  //     Result? result;
  //     final decoder = QRCodeDartScanDecoder(
  //       formats: [BarcodeFormat.qrCode],
  //     );
  //     if (_dt.rxQRCodeBytes.st != null) {
  //       logx.e(_dt.rxQRCodeBytes.st.toString());
  //       final xfile = XFile.fromData(_dt.rxQRCodeBytes.st!);
  //       // final xfile = XFile.fromData(data);
  //       result = await decoder.decodeFile(xfile);
  //       logx.e(result.toString());
  //     }
  //     verifySign(qrDataString: '$result');
  //   } catch (e) {
  //     logx.e('Error processing image: $e');
  //     nav.toDialog(
  //       CupertinoAlertDialog(
  //         title: const Text('Error'),
  //         content: Text('Failed to process the image. Error: $e'),
  //         actions: [
  //           CupertinoDialogAction(
  //             child: TextButton(
  //               onPressed: () => nav.back(),
  //               child: const Text('OK'),
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
  // ************************************
}
