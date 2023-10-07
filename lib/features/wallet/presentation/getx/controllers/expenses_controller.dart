import 'package:get/get.dart';

import '../../../domain/entities/expenses.dart';
import '../../../domain/use cases/add_expenses.dart';
import '../../../domain/use cases/delete_expenses.dart';
import '../../../domain/use cases/get_expenses.dart';
import '../../../domain/use cases/update_expenses.dart';

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
        update();
      },
    );
  }

  Future<void> addExpenses(Expenses expenses) async {
    final result = await addExpensesUseCase.call(expenses);
    result.fold(
      (failure) => Get.snackbar(
        'Error',
        failure.runtimeType.toString(),
        snackPosition: SnackPosition.TOP,
      ),
      (data) {
        expenseslist.add(expenses);
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
}
