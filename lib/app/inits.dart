part of '_index.dart';

Future<void> inits() async {
  logx.wtf('inits start');

  WidgetsFlutterBinding.ensureInitialized();

  await RM.storageInitializer(StoreHive());

  // if (!PlatformType.isWindows) {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Serv.auth.init();
  // x1FcmServ.init();
  // x1AuthServ.init();
  // }

  Serv.sample.init();
  Serv.signature.init();
  Serv.auth.init();

  logx.wtf('inits success');
}
