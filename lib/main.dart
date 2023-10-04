import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'imports.dart';

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
        ...AUTH,
        ...USER,
      ],
    );
  }
}
