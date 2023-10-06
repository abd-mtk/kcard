import 'package:equatable/equatable.dart';

class Budget extends Equatable {
  final double currentBudget;
  final double expenses;
  final double income;
  final double debt;

  const Budget({
    required this.currentBudget,
    required this.expenses,
    required this.income,
    required this.debt,
  });

  @override
  List<Object?> get props => [
        currentBudget,
        expenses,
        income,
        debt,
      ];
}
