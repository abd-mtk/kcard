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

  Future<void> getBudget() async {
    final results = await getBudgetUseCase.call();
    results.fold((left) {
      Get.snackbar('Error', left.runtimeType.toString());
    }, (right) {
      budget = right;
      update();
    });
    update();
  }

  Future<void> updateBudget(Budget budget) async {
    final results = await updateBudgetUseCase.call(budget);
    results.fold((left) {
      Get.snackbar('Error', left.runtimeType.toString());
    }, (right) {
      Get.snackbar('Success', 'Budget updated');
    });
    update();
  }
}
