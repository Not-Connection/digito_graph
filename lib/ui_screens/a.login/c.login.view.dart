part of '_index.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(56),
      //   child: LoginAppbar(),
      // ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: OnFormBuilder(
            listenTo: _dt.rxForm,
            builder: () => Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.asset(
                        'assets/images/splash.png',
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Login',
                        textScaler: TextScaler.linear(1.7),
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10),

                    const LoginEmail(),
                    const SizedBox(height: 10),
                    const LoginPassword(),
                    const SizedBox(height: 20),
                    const SizedBox(
                      width: 200,
                      child: LoginSubmit(),
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      thickness: 1.5,
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      width: 200,
                      child: LoginGoogle(),
                    ),
                    const SizedBox(height: 2),
                    // SizedBox(
                    //   width: 200,
                    //   child: LoginAnon(),
                    // ),
                    // SizedBox(height: 20),
                    const LoginToRegister()
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
