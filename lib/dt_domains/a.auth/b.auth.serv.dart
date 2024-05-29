part of '_index.dart';

class AuthServ {
  init() {
    logxx.i(AuthServ, 'AuthServ init ...');
    _pv.rxUser.subscription = x1FbAuth.st.instance.authStateChanges().listen(
          (event) => _pv.rxUser.st = event,
        );
  }

  responseAuthState(User? user) async {
    if (nav.routeData.location == '/login' || nav.routeData.location == '/register') {
      if (user != null) {
        nav.toReplacement(Routes.home);
      }
    } else {
      if (user == null) {
        nav.toAndRemoveUntil(Routes.login);
      }
    }
  }

  close() => _pv.rxUser.subscription?.cancel();

  createUserWithEmailAndPassword(String email, String password) {
    x1FbAuth.st.createUserWithEmailAndPassword(email, password);

    // x1FbAuth.st.createUserWithEmailAndPassword(email, password);
  }

  signInWithEmailAndPassword(String email, String password) {
    x1FbAuth.st.signInWithEmailAndPassword(email, password);
  }

  signInWithGoogle() {
    x1FbAuth.st.signInWithGoogle();
  }

  signInAnonymously() {
    x1FbAuth.st.signInAnonymously();
  }

  signOut() {
    x1FbAuth.st.signOut();
    logx.e(_pv.rxUser.st.toString());
  }

  deleteAccount() async {
    x1FbAuth.st.deleteAccount(_pv.rxUser.st);
  }
}
