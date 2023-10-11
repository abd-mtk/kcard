import 'package:flutter/material.dart';

import '../screens/transaction_charts_screen.dart';
import '../screens/wallet_charts_screen.dart';

class DashboardTabsView extends StatelessWidget {
  const DashboardTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          WalletChartsScreen(),
          TransactionChartsScreen(),
        ],
      ),
    );
  }
}
