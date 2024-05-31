part of '_index.dart';

class HomeCtrl {
  init() => logxx.i(HomeCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  Color getThemePrimary(BuildContext context) {
    return Theme.of(context).colorScheme.primary;
  }

  signOut() => Serv.auth.signOut();

  deleteAccount() => Serv.auth.deleteAccount();

  final rxHistories = Prov.signature.st.rxHistories;

  clearHistories() => Serv.signature.clearHistories();
}
