import 'package:get/get.dart';

import '../../../../features/wallet/presentation/screens/budget_details_screen.dart';
import '../../../../features/wallet/presentation/screens/budget_edit_screen.dart';
import '../../../../features/wallet/presentation/screens/payment_add_screen.dart';
import '../../../../features/wallet/presentation/screens/payment_screen.dart';
import '../../../../features/wallet/presentation/screens/index_screen.dart';

// ignore: non_constant_identifier_names
List<GetPage<dynamic>> WALLET = [
  GetPage(
    name: WalletIndexScreen.routeName,
    page: () => WalletIndexScreen(),
  ),
  GetPage(
    name: BudgetDetailsScreen.routeName,
    page: () => BudgetDetailsScreen(),
  ),
  GetPage(
    name: BudgetEditScreen.routeName,
    page: () => BudgetEditScreen(),
  ),
  GetPage(
    name: PaymentAddScreen.routeName,
    page: () => PaymentAddScreen(),
  ),
  GetPage(
    name: PaymentScreen.routeName,
    page: () => PaymentScreen(),
  ),
];
