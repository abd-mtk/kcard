import 'package:get/get.dart';

import '../../../../features/auth/presentation/getx/bindings/auth_binding.dart';
import '../../../../features/auth/presentation/getx/middlewares/auth_middleware.dart';
import '../../../../features/auth/presentation/screens/login_screen.dart';
import '../../../../features/auth/presentation/screens/register_screen.dart';
import '../../../../features/auth/presentation/screens/welcome_screen.dart';
import '../../../../features/dashboard/presentation/getx/bindings/dashboard_binding.dart';
import '../../../../features/home/bindings/home_binding.dart';
import '../../../../features/home/screens/home_screen.dart';
import '../../../../features/transaction/presentation/getx/bindings/transaction_binding.dart';
import '../../../../features/user/presentation/getx/bindings/edit_profile_binding.dart';
import '../../../../features/user/presentation/getx/bindings/profile_binding.dart';
import '../../../../features/wallet/presentation/getx/Bindings/budget_binding.dart';
import '../../../../features/wallet/presentation/getx/Bindings/payment_binding.dart';

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
  GetPage(
    name: HomeScreen.routeName,
    page: () => HomeScreen(),
    bindings: [
      HomeBinging(),
      BudgetBinding(),
      ProfileBinding(),
      EditProfileBinding(),
      PaymentBinding(),
      TransactionBinding(),
      DashboardBindging(),
    ],
  ),
];
