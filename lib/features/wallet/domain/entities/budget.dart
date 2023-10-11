import 'package:equatable/equatable.dart';

class Budget extends Equatable {
  final double currentBudget;
  final double payment;
  final double income;
  final double debt;

  const Budget({
    required this.currentBudget,
    required this.payment,
    required this.income,
    required this.debt,
  });

  @override
  List<Object?> get props => [
        currentBudget,
        payment,
        income,
        debt,
      ];
}
