import 'app/config/router/router.dart';
import 'imports.dart';

class KCardApp extends StatelessWidget {
  const KCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightGreenTheme,
      darkTheme: darkYellowTheme,
      themeMode: ThemeMode.light,
      initialRoute: WelcomeScreen.routeName,
      initialBinding: AuthBinding(),
      getPages: ROUTER,
    );
  }
}
