import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/budget.dart';
import '../../../domain/use cases/get_budget.dart';
import '../../../domain/use cases/update_budget.dart';

class BudgetController extends GetxController {
  GetBudgetUseCase getBudgetUseCase;
  UpdateBudgetUseCase updateBudgetUseCase;

  BudgetController(
      {required this.getBudgetUseCase, required this.updateBudgetUseCase});

  Budget? budget;

  TextEditingController currentBudgetController = TextEditingController();
  TextEditingController paymentController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController debtController = TextEditingController();

  Future<void> getBudget() async {
    final results = await getBudgetUseCase.call();
    results.fold((left) {
      // Get.snackbar('No Budget Data', left.runtimeType.toString());
    }, (right) {
      budget = right;
      currentBudgetController.text = budget!.currentBudget.toString();
      paymentController.text = budget!.payment.toString();
      incomeController.text = budget!.income.toString();
      debtController.text = budget!.debt.toString();
      update();
    });
    update();
  }

  Future<void> updateBudget() async {
    final results = await updateBudgetUseCase.call(Budget(
      currentBudget: double.parse(currentBudgetController.text),
      payment: double.parse(paymentController.text),
      income: double.parse(incomeController.text),
      debt: double.parse(debtController.text),
    ));
    results.fold((left) {
      // Get.snackbar('Error', left.runtimeType.toString());
    }, (right) {
      Get.snackbar('Success', 'Budget updated');
      getBudget();
    });
    update();
  }

  Future<void> receive(String value) async {
    try {
      currentBudgetController.text =
          (double.parse(currentBudgetController.text) + double.parse(value))
              .toString();

      updateBudget();
      getBudget();
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    }
  }

  Future<void> send(String value) async {
    try {
      currentBudgetController.text =
          (double.parse(currentBudgetController.text) - double.parse(value))
              .toString();

      updateBudget();
      getBudget();
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    getBudget();
    super.onInit();
  }
}
