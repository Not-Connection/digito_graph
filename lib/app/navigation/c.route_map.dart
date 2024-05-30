part of '_index.dart';

class RouteMap {
  RouteMap._();

  static final data = {
    Routes.home: (RouteData data) => const HomeView(),
    Routes.sampleSatu: (RouteData data) => const SampleSatuView(),
    Routes.sampleDua: (RouteData data) => const SampleDuaView(),
    Routes.sampleTiga: (RouteData data) => const SampleTigaView(),
    Routes.signature: (RouteData data) => const SignatureView(),
    Routes.signatureResult: (RouteData data) => const SignatureResult(),
    Routes.verify: (RouteData data) => const VerifyView(),
    Routes.login: (RouteData data) => const LoginView(),
    Routes.register: (RouteData data) => const RegisterView(),
    Routes.profile: (RouteData data) => const ProfileView(),
  };
}
