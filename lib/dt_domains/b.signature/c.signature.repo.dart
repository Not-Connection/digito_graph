part of '_index.dart';

class SignatureRepo {
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.s('random value coming from SignatureRepo');
    return x;
  }
}