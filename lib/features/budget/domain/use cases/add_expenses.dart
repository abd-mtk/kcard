import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/budget/failures.dart';
import '../entities/expenses.dart';
import '../repositories/expenses_repositories.dart';

class AddExpensesUseCase {
  final ExpensesRepository _repository;

  AddExpensesUseCase(this._repository);

  Future<Either<ExpensesFailure, Unit>> call(Expenses params) async {
    return await _repository.addExpenses(params);
  }
}
