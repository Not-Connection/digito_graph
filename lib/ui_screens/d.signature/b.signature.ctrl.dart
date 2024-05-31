part of '_index.dart';

class SignatureCtrl {
  init() => logxx.i(SignatureCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<SimpleKeyPair> getNewKeyPair() async => await _dt.algorithm.newKeyPair();

  Future<Signature> getSignature(Uint8List bytes) async => await _dt.algorithm.sign(
        bytes,
        keyPair: await getNewKeyPair(),
      );

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

  Uint8List compressData(Uint8List data) {
    final encoder = GZipEncoder();
    return encoder.encode(data) as Uint8List;
  }

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

    final qrDataString = '$signatureBase64|$publicKeybase64';
    final qrContent = qrDataString;
    logx.w(qrContent);

    createQRCodeFromSignature(pdfBytes: fileBytes, qrContent: qrContent);
  }

  addToHistories(String qrImage, String docImage) => Serv.signature.addToHistories(qrImage, docImage);

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

    final qrImageBytes = await fileResult.readAsBytes();

    _dt.rxQRCodeBytes.st = qrImageBytes;

    final fusion.PdfDocument document = fusion.PdfDocument(
      inputBytes: pdfBytes,
    );

    final Uint8List imageData = qrImageBytes;

    final fusion.PdfBitmap image = fusion.PdfBitmap(imageData);

    final height = document.pages[0].graphics.size.height;

    document.pages[0].graphics.drawImage(image, Rect.fromLTWH(20, height - 70, 60, 60));

    List<int> bytes = await document.save();

    _dt.rxResultPDFwithQRCode.st =
        await File('${directory.path}/${_dt.rxFilePickedResult.st!.files.single.name}-signatured.pdf')
            .writeAsBytes(bytes);
    final elementStringPath = _dt.rxResultPDFwithQRCode.st!.path.split('/');
    _dt.rxResultPDFwithQRCodePath.st = elementStringPath[6];

    final resultPDFBytes = await _dt.rxResultPDFwithQRCode.st!.readAsBytes();

    _dt.rxPdfControllerResultPDFWithQRCode.st = PdfControllerPinch(
      document: PdfDocument.openData(
        resultPDFBytes,
      ),
    );

    // _dt.rxQRCodeImage.st = await File('${directory.path}/qr.png').writeAsBytes(bytes);

    // addToHistories(_dt.rxQRCodeImage.st!.path, _dt.rxResultPDFwithQRCodePath.st);
    logx.i('PDF dengan QR code berhasil dibuat dan disimpan.');
  }

  downloadPDF() async {
    final resultPDFBytes = await _dt.rxResultPDFwithQRCode.st!.readAsBytes();

    final directory = Directory('/storage/emulated/0/Download');
    File('${directory.path}/${_dt.rxResultPDFwithQRCodePath.st}').writeAsBytesSync(resultPDFBytes);
  }

  Future<void> shareFile(BuildContext context) async {
    final result = await Share.shareXFiles(
      [XFile(_dt.rxResultPDFwithQRCode.st!.path)],
      text: 'Check this out',
    );

    if (result.status == ShareResultStatus.success) {
      _showSnackBar(context, 'Thank you for sharing the picture!');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ));
  }
}
