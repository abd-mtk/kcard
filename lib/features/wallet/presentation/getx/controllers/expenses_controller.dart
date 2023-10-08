import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/expenses.dart';
import '../../../domain/use cases/add_expenses.dart';
import '../../../domain/use cases/delete_expenses.dart';
import '../../../domain/use cases/get_expenses.dart';
import '../../../domain/use cases/update_expenses.dart';
import 'budget_controller.dart';

class ExpensesController extends GetxController {
  GetExpensesUseCase getExpensesUseCase;
  AddExpensesUseCase addExpensesUseCase;
  DeleteExpensesUseCase deleteExpensesUseCase;
  UpdateExpensesUseCase updateExpensesUseCase;

  ExpensesController({
    required this.getExpensesUseCase,
    required this.addExpensesUseCase,
    required this.deleteExpensesUseCase,
    required this.updateExpensesUseCase,
  });

  Expenses? expenses;
  List<Expenses> expenseslist = [];
  BudgetController budgetController = Get.find<BudgetController>();
  TextEditingController titleController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  Future<void> getExpenses() async {
    final result = await getExpensesUseCase.call();
    result.fold(
      (failure) => Get.snackbar(
        'Error',
        failure.runtimeType.toString(),
        snackPosition: SnackPosition.TOP,
      ),
      (data) {
        expenseslist = data;
        Get.snackbar(
          'Success',
          'Expenses loaded successfully',
          snackPosition: SnackPosition.TOP,
        );
        update();
      },
    );
  }

  Future<void> addExpenses() async {
    Expenses expenses = Expenses(
      title: titleController.text,
      value: double.parse(valueController.text),
      category: categoryController.text,
      note: noteController.text,
      date: DateTime.now().toString(),
    );
    final result = await addExpensesUseCase.call(expenses);
    result.fold(
      (failure) => Get.snackbar(
        'Error',
        failure.runtimeType.toString(),
        snackPosition: SnackPosition.TOP,
      ),
      (data) {
        expenseslist.add(expenses);
        editWallet(categoryController.text);
        clear();
        update();
      },
    );
  }

  Future<void> deleteExpenses(Expenses expenses) async {
    final result = await deleteExpensesUseCase.call(expenses.id!);
    result.fold(
      (failure) => Get.snackbar(
        'Error',
        failure.runtimeType.toString(),
        snackPosition: SnackPosition.TOP,
      ),
      (data) {
        expenseslist.remove(expenses);
        update();
      },
    );
  }

  Future<void> updateExpenses(Expenses expenses) async {
    final result = await updateExpensesUseCase.call(expenses);
    result.fold(
      (failure) => Get.snackbar(
        'Error',
        failure.runtimeType.toString(),
        snackPosition: SnackPosition.TOP,
      ),
      (data) {
        expenseslist.removeWhere((element) => element.id == expenses.id);
        expenseslist.add(expenses);
        update();
      },
    );
  }

  @override
  void onInit() {
    getExpenses();
    super.onInit();
  }

  void clear() {
    titleController.clear();
    valueController.clear();
    categoryController.clear();
    noteController.clear();
  }

  void editWallet(String value) {
    if (value == "Expense") {
      budgetController.currentBudgetController.text =
          (double.parse(budgetController.currentBudgetController.text) -
                  double.parse(valueController.text))
              .toString();
      budgetController.expenseController.text =
          (double.parse(budgetController.expenseController.text) +
                  double.parse(valueController.text))
              .toString();
    } else if (value == "Income") {
      budgetController.currentBudgetController.text =
          (double.parse(budgetController.currentBudgetController.text) +
                  double.parse(valueController.text))
              .toString();
      budgetController.incomeController.text =
          (double.parse(budgetController.incomeController.text) +
                  double.parse(valueController.text))
              .toString();
    } else if (value == "Debt") {
      budgetController.currentBudgetController.text =
          (double.parse(budgetController.currentBudgetController.text) +
                  double.parse(valueController.text))
              .toString();
      budgetController.debtController.text =
          (double.parse(budgetController.debtController.text) +
                  double.parse(valueController.text))
              .toString();
    }
    budgetController.updateBudget();
    budgetController.getBudget();
  }
}
