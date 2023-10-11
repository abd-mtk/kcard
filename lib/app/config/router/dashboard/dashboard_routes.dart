import 'package:get/get.dart';

import '../../../../features/dashboard/presentation/getx/bindings/dashboard_binding.dart';
import '../../../../features/dashboard/presentation/screens/dashboard_index_screen.dart';
import '../../../../features/dashboard/presentation/screens/transaction_charts_screen.dart';
import '../../../../features/dashboard/presentation/screens/wallet_charts_screen.dart';

// ignore: non_constant_identifier_names
List<GetPage<dynamic>> DASHBOARD = [
  GetPage(
      name: DashBoardIndexScreen.routeName,
      page: () => DashBoardIndexScreen(),
      bindings: [DashboardBindging()]),
  GetPage(
      name: WalletChartsScreen.routeName,
      page: () => WalletChartsScreen(),
      bindings: [DashboardBindging()]),
  GetPage(
      name: TransactionChartsScreen.routeName,
      page: () => TransactionChartsScreen()),
];
