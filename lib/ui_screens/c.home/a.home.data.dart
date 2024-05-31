part of '_index.dart';

class HomeData {
  final rxTitle = 'Home'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxUser = Prov.auth.st.rxUser;

  final rxHistories = Prov.signature.st.rxHistories;

  final rxResultPDFwithQRCodePath = RM.inject<String>(() => '', autoDisposeWhenNotUsed: true);
}
