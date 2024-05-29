part of '_index.dart';

class LoginData {
  final rxTitle = 'Login'.inj();

  final rxInt = 0.inj();

  final rxUser = Prov.auth.st.rxUser;

  // final focusScopeNode = FocusScopeNode();

  final rxIsObscurePassword = true.inj();

  final rxForm = RM.injectForm(
    submit: () async => Ctrl.login.signInWithEmailAndPassword(),
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );

  final rxEmail = RM.injectTextEditing(
    validators: [
      Validate.isNotEmpty,
      Validate.isEmail,
    ],
  );

  final rxPassword = RM.injectTextEditing(
    validators: [
      Validate.isNotEmpty,
      Validate.alphaNumeric,
      Validate.spaceNotAllowed,
      Validate.minChars,
      Validate.pwdContain,
    ],
  );
}
