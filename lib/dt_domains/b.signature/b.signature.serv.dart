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

  addToHistories(String qrImage, String docImage) {
    _pv.rxHistories.setState(
      (s) => Histories(
        values: [
          ...s.values,
        ]..insert(
            0,
            History(
              qrBytes: qrImage,
              documentPath: docImage,
            ),
          ),
      ),
    );
  }

  clearHistories() {
    _pv.rxHistories.setState((s) => Histories(values: []));
  }
}
