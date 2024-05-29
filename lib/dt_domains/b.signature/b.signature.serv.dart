part of '_index.dart';

class SignatureServ {
  void init() {
    logxx.i(SignatureServ, '...');
  }

  void updateRandom() {
    _pv.rxRandom.st = _rp.giveNewRandom();
  }

  void onSetState() {
    logzz.i(SignatureServ, 'rxCounter setState success');
  }
}