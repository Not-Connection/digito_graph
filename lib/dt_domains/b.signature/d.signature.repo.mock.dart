part of '_index.dart';

class SignatureRepoMock implements SignatureRepo {
  @override
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.wtf('random value coming from SignatureRepoMock');
    return x;
  }
}