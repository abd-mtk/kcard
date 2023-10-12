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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        actions: [
          IconButton(
            onPressed: () {
              budgetController.getBudget();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: DefaultTabController(
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
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    radius: 10,
                    tabs: walletTabs,
                  ),
                ],
              ),
            ),
            const WalletTabsView()
          ],
        ),
      ),
    );
  }
}
