part of '_index.dart';

class ProfileData {
  final rxTitle = 'Profile'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxUser = Prov.auth.st.rxUser;

  final rxForm = RM.injectForm(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    submit: () async {
      await _ct.changeProfileData();
    },
  );

  final rxUid = RM.injectTextEditing(
    text: Prov.auth.st.rxUser.st!.uid,
    validators: [Validate.isNotEmpty],
  );

  final rxEmail = RM.injectTextEditing(
    text: '${Prov.auth.st.rxUser.st!.email}',
    validators: [
      Validate.isNotEmpty,
      Validate.isEmail,
    ],
  );
  final rxUsername = RM.inject(
    () => RM.injectTextEditing(
      text: Prov.auth.st.rxUser.st!.displayName != null ? '${Prov.auth.st.rxUser.st!.displayName}' : '',
      validators: [
        Validate.isNotEmpty,
        Validate.fullName,
      ],
    ),
  );
}
