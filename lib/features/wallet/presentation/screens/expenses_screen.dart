import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/expenses_controller.dart';
import '../widgets/expenses_card.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({super.key});
  static const routeName = '/expenses';
  final ExpensesController expensesController = Get.find<ExpensesController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Image.asset('assets/images/expense2.png', height: Get.height * 0.2),
        const Divider(
          color: Colors.grey,
        ),
        expensesController.expenseslist.isEmpty
            ? const Center(
                child: Text('No Expenses Yet'),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: expensesController.expenseslist.length,
                itemBuilder: (context, index) {
                  return ExpensesCard(
                    expenses: expensesController.expenseslist[index],
                    image: 'assets/images/coin.png',
                  );
                },
              ),
      ]),
    );
  }
}
