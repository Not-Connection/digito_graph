part of '_index.dart';

class SignatureData {
  final rxTitle = 'Signature'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxPersonalInfo = RM.inject<PersonalInfo>(() => PersonalInfo());

  final rxPickedFile = RM.inject<File?>(() => null);
  final rxPickedPdfFileOri = RM.inject<File?>(() => null);
  final rxPickedPdfFileQRCode = RM.inject<File?>(() => null);

  final rxResultPDFwithQRCode = RM.inject<File?>(() => null, autoDisposeWhenNotUsed: false);
  final rxResultPDFwithQRCodePath = RM.inject<String>(() => '', autoDisposeWhenNotUsed: true);

  final rxQRCodeFromPDFPath = RM.inject<String?>(() => null);

  final rxFilePickedResult = RM.inject<FilePickerResult?>(
    () => null,
  );

  final algorithm = Ed25519();

  final rxSignature = RM.inject<Signature?>(() => null);

  // final barcodeScanner = BarcodeScanner(formats: [BarcodeFormat.all]);

  final rxIsSignatureValid = RM.inject<bool?>(() => null);

  final rxPdfController = RM.inject<PdfControllerPinch?>(() => null);
  final rxPdfControllerVerifyOri = RM.inject<PdfControllerPinch?>(() => null);
  final rxPdfControllerVerifyQR = RM.inject<PdfControllerPinch?>(() => null);
  final rxPdfControllerResultPDFWithQRCode = RM.inject<PdfControllerPinch?>(
    () => null,
    autoDisposeWhenNotUsed: false,
  );

  final rxSelectedIndex = RM.inject<int>(() => 0);

  final rxQRCodeBytes = RM.inject<Uint8List?>(() => null, autoDisposeWhenNotUsed: true);
  final rxQRCodeImage = RM.inject<File?>(() => null);
  final rxFileSignatured = RM.inject<File?>(() => null);

  final List<Widget> pages = [
    const SignatureContentSign(),
    const SignatureContentVerify(),
    const SignatureContentProfile(),
  ];

  final rxQRDataString = RM.inject<String>(() => '');
}
