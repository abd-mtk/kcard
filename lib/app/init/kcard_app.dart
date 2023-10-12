import '../../features/user/presentation/getx/controllers/setting_controller.dart';
import '../config/router/router.dart';
import 'imports.dart';

class KCardApp extends StatelessWidget {
  KCardApp({super.key});

  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: settingController.currentTheme,
        initialRoute: WelcomeScreen.routeName,
        initialBinding: AuthBinding(),
        getPages: ROUTER,
      );
    });
  }
}
