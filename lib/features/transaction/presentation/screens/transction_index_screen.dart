import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../widgets/transaction_tabs.dart';
import '../widgets/transction_tabs_view.dart';

class TransactionIndexScreen extends StatelessWidget {
  const TransactionIndexScreen({super.key});
  static const String routeName = '/transaction';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 3,
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
                  radius: 10,
                  tabs: transactionTabs,
                ),
              ],
            ),
          ),
          TransactionTabsView()
        ],
      ),
    );
  }
}
