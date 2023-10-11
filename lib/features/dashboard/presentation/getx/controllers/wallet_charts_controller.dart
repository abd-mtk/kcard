import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../../wallet/domain/entities/budget.dart';
import '../../../../wallet/domain/use cases/get_budget.dart';
import '../../../../wallet/domain/use cases/get_expenses.dart';

class WalletChartsController extends GetxController {
  GetBudgetUseCase getBudgetUseCase;
  GetExpensesUseCase getExpensesUseCase;

  WalletChartsController(
      {required this.getBudgetUseCase, required this.getExpensesUseCase});
  Budget? budget;
  List<FlSpot> expensespots = [];
  List<FlSpot> incomespots = [];
  List<FlSpot> debtspots = [];
  // List<Expenses>? expense;
  // List<Expenses>? income;
  // List<Expenses>? debt;

  List<double> expensevalues = [];
  List<double> incomevalues = [];
  List<double> debtvalues = [];

  void getBudget() async {
    final resulte = await getBudgetUseCase();
    resulte.fold((l) {
      Get.snackbar('Error', l.runtimeType.toString());
    }, (r) {
      budget = r;
      // print("============Budget============");
      // print(budget);
    });
    update();
  }

  void getExpenses() async {
    final resulte = await getExpensesUseCase();
    resulte.fold((l) {
      Get.snackbar('Error', l.runtimeType.toString());
    }, (r) {
      // expense = r.where((element) => element.category == 'Expense').toList();
      // income = r.where((element) => element.category == 'Income').toList();
      // debt = r.where((element) => element.category == 'Debt').toList();
      //  get the value of each category as a list

      expensevalues = r
          .where((element) => element.category == 'Expense')
          .map((e) => e.value)
          .toList();

      for (var i = 0; i < expensevalues.length; i++) {
        expensespots.add(FlSpot(i.toDouble(), expensevalues[i]));
      }
      incomevalues = r
          .where((element) => element.category == 'Income')
          .map((e) => e.value)
          .toList();
      for (var i = 0; i < incomevalues.length; i++) {
        incomespots.add(FlSpot(i.toDouble(), incomevalues[i]));
      }
      debtvalues = r
          .where((element) => element.category == 'Debt')
          .map((e) => e.value)
          .toList();
      for (var i = 0; i < debtvalues.length; i++) {
        debtspots.add(FlSpot(i.toDouble(), debtvalues[i]));
      }

      // print("============Expense Values============");
      // print(expensevalues);
      // print("============Income Values============");
      // print(incomevalues);
      // print("============Debt Values============");
      // print(debtvalues);

      // print("============Expenses============");
      // print(expense);
      // print("============Income============");
      // print(income);
      // print("============Debt============");
      // print(debt);
    });
    update();
  }

  @override
  void onInit() {
    getBudget();
    getExpenses();
    super.onInit();
  }
}
