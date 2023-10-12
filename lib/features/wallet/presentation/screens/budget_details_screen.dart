import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcard/app/utils/constants/reloaad_box.dart';

import '../getx/controllers/budget_controller.dart';
import '../widgets/budget_type.dart';

class BudgetDetailsScreen extends StatelessWidget {
  BudgetDetailsScreen({super.key});
  static const routeName = '/budget-details';
  final BudgetController budgetController = Get.find<BudgetController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BudgetController>(builder: (_) {
      return budgetController.budget != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/bond.png',
                      height: Get.height * 0.2),
                  const Divider(
                    color: Colors.grey,
                  ),
                  BudgetType(
                    title: 'Current Budget',
                    value: budgetController.budget!.currentBudget.toString(),
                    image: 'assets/images/budget2.png',
                    onTap: () {},
                    color: Colors.green[800],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  BudgetType(
                      title: 'Payment',
                      value: budgetController.budget!.payment.toString(),
                      image: 'assets/images/expenses.png',
                      onTap: () {},
                      color: Colors.red[700]),
                  const Divider(
                    color: Colors.grey,
                  ),
                  BudgetType(
                      title: 'Incom',
                      value: budgetController.budget!.income.toString(),
                      image: 'assets/images/income.png',
                      onTap: () {},
                      color: Colors.blue[700]),
                  const Divider(
                    color: Colors.grey,
                  ),
                  BudgetType(
                      title: 'Debt',
                      value: budgetController.budget!.debt.toString(),
                      image: 'assets/images/debt.png',
                      onTap: () {},
                      color: Colors.orange[700]),
                  const Divider(
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          : ReloadBox(onPressed: budgetController.getBudget);
    });
  }
}
