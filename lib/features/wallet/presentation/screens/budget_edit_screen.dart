import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../getx/controllers/budget_controller.dart';
import '../widgets/budget_edit.dart';

class BudgetEditScreen extends StatelessWidget {
  BudgetEditScreen({super.key});
  static const routeName = '/budget-edit';
  final BudgetController budgetController = Get.find<BudgetController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Image.asset(
          'assets/images/edit_budget.png',
          height: 150,
          width: double.infinity,
        ),
        const Divider(
          color: Colors.grey,
        ),
        EditBudgetFiled(
          label: 'Current Budget',
          icon: Iconsax.wallet_money,
          controller: budgetController.currentBudgetController,
          keyboardType: TextInputType.number,
        ),
        EditBudgetFiled(
          label: 'Expense',
          icon: Iconsax.money_send,
          controller: budgetController.expenseController,
          keyboardType: TextInputType.number,
        ),
        EditBudgetFiled(
          label: 'Income',
          icon: Iconsax.money_recive,
          controller: budgetController.incomeController,
          keyboardType: TextInputType.number,
        ),
        EditBudgetFiled(
          label: 'Debt',
          icon: Iconsax.wallet_search,
          controller: budgetController.debtController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            budgetController.updateBudget();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2,
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Edit Budget'),
                Icon(Iconsax.wallet_add_1),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
