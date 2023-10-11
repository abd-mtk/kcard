import 'package:get/get.dart';

import '../../../../features/dashboard/presentation/getx/bindings/wallet_charts_binding.dart';
import '../../../../features/dashboard/presentation/screens/dashboard_index_screen.dart';
import '../../../../features/dashboard/presentation/screens/transaction_charts_screen.dart';
import '../../../../features/dashboard/presentation/screens/wallet_charts_screen.dart';

// ignore: non_constant_identifier_names
List<GetPage<dynamic>> DASHBOARD = [
  GetPage(
      name: DashBoardIndexScreen.routeName,
      page: () => DashBoardIndexScreen(),
      bindings: [WalletChartsBinding()]),
  GetPage(
      name: WalletChartsScreen.routeName,
      page: () => WalletChartsScreen(),
      bindings: [WalletChartsBinding()]),
  GetPage(
      name: TransactionChartsScreen.routeName,
      page: () => TransactionChartsScreen()),
];
