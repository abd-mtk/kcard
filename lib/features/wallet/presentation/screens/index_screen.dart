import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/budget_controller.dart';
import '../widgets/wallet_tabs.dart';
import '../widgets/wallet_tabs_view.dart';

class WalletIndexScreen extends StatelessWidget {
  WalletIndexScreen({super.key});
  static const routeName = '/wallet-index';
  final BudgetController budgetController = Get.find<BudgetController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ButtonsTabBar(
                  splashColor: Colors.purple[300],
                  backgroundColor: Colors.purple[500],
                  unselectedBackgroundColor: Colors.grey[500],
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  labelStyle:
                      const TextStyle(color: Colors.white, fontSize: 16),
                  radius: 15,
                  tabs: walletTabs,
                ),
              ],
            ),
          ),
          const WalletTabsView()
        ],
      ),
    );
  }
}
