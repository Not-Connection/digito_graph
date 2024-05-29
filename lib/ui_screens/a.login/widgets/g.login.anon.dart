part of '../_index.dart';

class LoginAnon extends StatelessWidget {
  const LoginAnon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        _ct.signInAnonymously();
      },
      child: const Text('Masuk sebagai Anonim'),
    );
  }
}
