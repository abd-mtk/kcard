import '../../domain/entities/budget.dart';

class BudgetModel extends Budget {
  const BudgetModel(
      {required super.currentBudget,
      required super.expenses,
      required super.income,
      required super.debt});

  factory BudgetModel.fromJson(Map<String, dynamic> json) => BudgetModel(
      currentBudget: json['currentBudget'],
      expenses: json['expenses'],
      income: json['income'],
      debt: json['debt']);

  Map<String, dynamic> toJson() => {
        'currentBudget': currentBudget,
        'expenses': expenses,
        'income': income,
        'debt': debt
      };
}
