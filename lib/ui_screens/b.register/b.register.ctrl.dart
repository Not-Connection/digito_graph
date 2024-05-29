part of '_index.dart';

class RegisterCtrl {
  init() => logxx.i(RegisterCtrl, '...');

  action() => _dt.rxInt.setState((s) => s + 1);

  obscurePassword() {
    if (_dt.rxIsObscurePassword.st == true) {
      _dt.rxIsObscurePassword.st = false;
    } else {
      _dt.rxIsObscurePassword.st = true;
    }
  }

  obscureRetypePassword() {
    if (_dt.rxIsObscureRetypePassword.st == true) {
      _dt.rxIsObscureRetypePassword.st = false;
    } else {
      _dt.rxIsObscureRetypePassword.st = true;
    }
  }

  submit() => _dt.rxForm.submit();

  createUserWithEmailAndPassword() async {
    Serv.auth.createUserWithEmailAndPassword(
      _dt.rxEmail.value,
      _dt.rxPassword.value,
    );
    await Future.delayed(400.milliseconds);
  }
}
