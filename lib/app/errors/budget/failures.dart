import 'package:equatable/equatable.dart';

abstract class BudgetFailure extends Equatable {}
abstract class ExpensesFailure extends Equatable {}

class NetworkFailure extends BudgetFailure {
  @override
  List<Object?> get props => [];
}

class ExpensesNetworkFailure extends ExpensesFailure {
  @override
  List<Object?> get props => [];
}

class BudgetServerFailure extends BudgetFailure {
  @override
  List<Object?> get props => [];
}

class ExpensesServerFailure extends ExpensesFailure {
  @override
  List<Object?> get props => [];
}

class BudgetEmptyCacheFailure extends BudgetFailure {
  @override
  List<Object?> get props => [];
}

class ExpensesEmptyCacheFailure extends ExpensesFailure {
  @override
  List<Object?> get props => [];
}
