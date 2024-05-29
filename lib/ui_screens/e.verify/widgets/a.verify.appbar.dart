part of '../_index.dart';

class VerifyAppbar extends StatelessWidget {
  const VerifyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: OnReactive(() => Text(_dt.rxTitle.st)),
    );
  }
}
