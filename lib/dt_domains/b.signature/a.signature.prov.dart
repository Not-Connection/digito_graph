part of '_index.dart';

class SignatureProv {
  final rxRandom = RM.inject<int>(
    () => 0,
    autoDisposeWhenNotUsed: false,
    sideEffects: SideEffects(
      onSetState: (p0) => _sv.onSetState(),
    ),
  );

  final rxQRCodeBytes = RM.inject<Uint8List?>(() => null, autoDisposeWhenNotUsed: false);
}
