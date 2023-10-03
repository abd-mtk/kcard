import 'package:get/get.dart';
import 'package:kcard/features/auth/presentation/screens/login_screen.dart';

import '../../../../features/auth/presentation/screens/register_screen.dart';
import '../../../../features/auth/presentation/screens/welcome_screen.dart';

List<GetPage> AUTH_PAGES = [
  GetPage(name: WelcomeScreen.routeName, page: () => const WelcomeScreen()),
  GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
  GetPage(name: RegisterScreen.routeName, page: () => RegisterScreen()),
];
