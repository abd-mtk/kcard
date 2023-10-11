import '../../domain/entities/budget.dart';

class BudgetModel extends Budget {
  const BudgetModel(
      {required super.currentBudget,
      required super.payment,
      required super.income,
      required super.debt});

  factory BudgetModel.fromJson(Map<String, dynamic> json) => BudgetModel(
      currentBudget: json['currentBudget'],
      payment: json['payment'],
      income: json['income'],
      debt: json['debt']);

  factory BudgetModel.fromEntity(Budget budget) => BudgetModel(
      currentBudget: budget.currentBudget,
      payment: budget.payment,
      income: budget.income,
      debt: budget.debt);

  Map<String, dynamic> toJson() => {
        'currentBudget': currentBudget,
        'payment': payment,
        'income': income,
        'debt': debt
      };
}
