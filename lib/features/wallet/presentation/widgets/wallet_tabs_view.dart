import 'package:flutter/material.dart';

import '../screens/budget_details_screen.dart';
import '../screens/budget_edit_screen.dart';
import '../screens/payment_add_screen.dart';
import '../screens/payment_screen.dart';

class WalletTabsView extends StatelessWidget {
  const WalletTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          BudgetDetailsScreen(),
          BudgetEditScreen(),
          PaymentScreen(),
          PaymentAddScreen(),
        ],
      ),
    );
  }
}
