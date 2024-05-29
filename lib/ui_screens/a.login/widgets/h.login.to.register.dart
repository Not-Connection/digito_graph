part of '../_index.dart';

class LoginToRegister extends StatelessWidget {
  const LoginToRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            nav.toReplacement(Routes.register);
          },
          child: const Text('Don\'t have an account? Sign up'),
        ),
      ],
    );
  }
}
