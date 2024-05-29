part of '../_index.dart';

class LoginEmail extends StatelessWidget {
  const LoginEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => InputTextField(
        textEditingController: _dt.rxEmail.controller,
        focusNode: _dt.rxEmail.focusNode,
        keyboardType: TextInputType.emailAddress,
        onEditingComplete: () => _dt.rxPassword.focusNode.requestFocus(),
        errorText: _dt.rxEmail.error,
        labelText: 'Email',
        hintText: 'example@mail.com',
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }
}
