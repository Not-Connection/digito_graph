part of '_index.dart';

class LoginCtrl {
  init() => logxx.i(LoginCtrl, '...');

  action() => _dt.rxInt.setState((s) => s + 1);

  signInWithGoogle() => Serv.auth.signInWithGoogle();

  submit() => _dt.rxForm.submit();

  obscurePassword() {
    if (_dt.rxIsObscurePassword.st == true) {
      _dt.rxIsObscurePassword.st = false;
    } else {
      _dt.rxIsObscurePassword.st = true;
    }
  }

  signInWithEmailAndPassword() async {
    Serv.auth.signInWithEmailAndPassword(
      _dt.rxEmail.value,
      _dt.rxPassword.value,
    );
    Future.delayed(400.milliseconds);
  }

  signInAnonymously() {
    Serv.auth.signInAnonymously();
  }
}
