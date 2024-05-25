part of '_index.dart';

class App extends TopStatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DigitoGraph',
      debugShowCheckedModeBanner: true,
      theme: themeRM.darkTheme,
      routeInformationParser: nav.routeInformationParser,
      routerDelegate: nav.routerDelegate,
    );
  }
}
