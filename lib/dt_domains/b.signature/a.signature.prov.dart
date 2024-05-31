part of '_index.dart';

class SignatureProv {
  final rxRandom = RM.inject<int>(
    () => 0,
    autoDisposeWhenNotUsed: false,
    sideEffects: SideEffects(
      onSetState: (p0) => _sv.onSetState(),
    ),
  );

  // final rxQRCodeBytes = RM.inject<Uint8List?>(() => null, autoDisposeWhenNotUsed: true);

  final iv = encrypt.IV.fromSecureRandom(16);

  // final rxResultPDFwithQRCodePath = RM.inject<String>(() => '', autoDisposeWhenNotUsed: true);

  final rxQRCodeImage = RM.inject<File?>(() => null);

  final rxHistories = RM.inject<Histories>(
    () => Histories(),
    persist: () => PersistState(
      key: 'rxHistories',
      throttleDelay: 400,
      shouldRecreateTheState: false,
      toJson: (s) => s.toJson(),
      fromJson: (j) => Histories.fromJson(j),
    ),
  );
}
