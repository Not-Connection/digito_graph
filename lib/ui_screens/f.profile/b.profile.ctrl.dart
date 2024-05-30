part of '_index.dart';

class ProfileCtrl {
  init() => logxx.i(ProfileCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Future<void> changeProfileData() async {
    await _dt.rxUser.st!.updateDisplayName(
      _dt.rxUsername.st.controller.text,
    );
    await _dt.rxUser.st!.reload();
    _dt.rxUser.st = FirebaseAuth.instance.currentUser;
    nav.back();
  }

  submit() => _dt.rxForm.submit();
}
