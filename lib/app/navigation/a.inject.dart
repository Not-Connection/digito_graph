part of '_index.dart';

final nav = NavigationBuilder.create(
  // initialLocation: Routes.home,
  initialLocation: Prov.auth.st.rxUser.st == null ? Routes.login : Routes.home,

  routes: RouteMap.data,
  onNavigate: (data) => OnNavigate.action(data),
  onNavigateBack: (data) => OnNavigateBack.action(data),
  shouldUseCupertinoPage: true,
  navigatorObservers: [],
);
