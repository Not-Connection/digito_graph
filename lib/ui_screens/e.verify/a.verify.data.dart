part of '_index.dart';

class VerifyData {
  final rxTitle = 'Verify'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxPickedFile = RM.inject<File?>(() => null);

  final rxFilePickedResult = RM.inject<FilePickerResult?>(
    () => null,
  );
  final rxFilePickedResultNameOri = RM.inject(() => '');
  final rxFilePickedResultNameWatermark = RM.inject(() => '');
  final rxFilePickedResultPathOri = RM.inject(() => '');
  final rxFilePickedResultPathWatermark = RM.inject(() => '');

  final rxPdfController = RM.inject<PdfControllerPinch?>(() => null);
  final rxPdfControllerOri = RM.inject<PdfControllerPinch?>(() => null);

  final rxPDFImagePath = RM.inject<String>(() => '');

  final algorithm = Ed25519();

  final rxIsSignatureValid = RM.inject<bool?>(() => null);

  final rxQRCodeBytes = RM.inject<Uint8List?>(() => null, autoDisposeWhenNotUsed: true);
}
