import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcard/features/auth/presentation/getx/Bindings/auth_binding.dart';

import 'app/config/router/auth/auth_routes.dart';
import 'app/config/themes/dark_theme.dart';
import 'app/config/themes/light_theme.dart';
import 'app/utils/resources/services.dart';
import 'features/auth/presentation/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  await Get.putAsync(() => Services().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightGreenTheme,
      darkTheme: darkYellowTheme,
      themeMode: ThemeMode.light,
      initialRoute: WelcomeScreen.routeName,
      initialBinding: AuthBinding(),
      getPages: [
        ...AUTH_PAGES,
      ],
    );
  }
}
