part of '_index.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: RegisterAppbar(),
      ),
      body: OnFormBuilder(
        listenTo: _dt.rxForm,
        builder: () => Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RegisterEmail(),
                    SizedBox(height: 10),
                    RegisterPassword(),
                    SizedBox(height: 10),
                    RegisterRetype(),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: RegisterSubmit(),
                    ),
                    RegisterToLogin()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
