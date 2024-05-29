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
      // bottomNavigationBar: const SignatureBottomNavBar(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: const SignatureFab(),
      body: OnReactive(
        () => Center(
          child: _dt.pages.elementAt(_dt.rxSelectedIndex.st),
        ),
      ),
    );
  }
}
