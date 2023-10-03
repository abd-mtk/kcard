import 'package:get/get.dart';

import '../../../../features/auth/presentation/getx/Bindings/auth_binding.dart';
import '../../../../features/auth/presentation/getx/middlewares/auth_middleware.dart';
import '../../../../features/auth/presentation/screens/login_screen.dart';
import '../../../../features/auth/presentation/screens/register_screen.dart';
import '../../../../features/auth/presentation/screens/welcome_screen.dart';
import '../../../../features/user/presentation/screens/home_screen.dart';

// ignore: non_constant_identifier_names
List<GetPage<dynamic>> AUTH = [
  GetPage(
    name: WelcomeScreen.routeName,
    page: () => const WelcomeScreen(),
    middlewares: [AuthMiddleware()],
    bindings: [AuthBinding()],
  ),
  GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
  GetPage(name: RegisterScreen.routeName, page: () => RegisterScreen()),
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
];
