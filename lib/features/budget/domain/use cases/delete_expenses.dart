import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/budget/failures.dart';
import '../repositories/expenses_repositories.dart';

class DeleteExpensesUseCase  {
  final ExpensesRepository _repository;

  DeleteExpensesUseCase(this._repository);

  Future<Either<ExpensesFailure, Unit>> call(int expensesId) async {
    return await _repository.deleteExpenses(expensesId);
  }
}