part of '_index.dart';

class SignatureView extends StatelessWidget {
  const SignatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SignatureAppbar(),
      ),
      body: OnReactive(
        () => const Center(
          child: SignatureContentSign(),
        ),
      ),
    );
  }
}
