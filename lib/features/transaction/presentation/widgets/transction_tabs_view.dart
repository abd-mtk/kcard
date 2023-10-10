import 'package:flutter/material.dart';

import '../screens/transaction_edit_screen.dart';
import '../screens/transaction_received_screen.dart';
import '../screens/transaction_sent_screen.dart';


class TransactionTabsView extends StatelessWidget {
  const TransactionTabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          TransactionSentScreen(),
          TransactionReceivedScreen(),
          TransactionEditScreen(),
        ],
      ),
    );
  }
}
