part of '../_index.dart';

class SignatureAppbar extends StatelessWidget {
  const SignatureAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: OnReactive(() => Text(_dt.rxTitle.st)),
    );
  }
}
