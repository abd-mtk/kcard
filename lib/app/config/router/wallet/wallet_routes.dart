import 'package:get/get.dart';

import '../../../../features/wallet/presentation/screens/budget_details_screen.dart';
import '../../../../features/wallet/presentation/screens/budget_edit_screen.dart';
import '../../../../features/wallet/presentation/screens/expenses_add_screen.dart';
import '../../../../features/wallet/presentation/screens/expenses_screen.dart';
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
    name: ExpensesAddScreen.routeName,
    page: () => ExpensesAddScreen(),
  ),
  GetPage(
    name: ExpensesScreen.routeName,
    page: () => ExpensesScreen(),
  ),
];
