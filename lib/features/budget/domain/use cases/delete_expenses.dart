import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../repositories/expenses_repositories.dart';

class DeleteExpensesUseCase  {
  final ExpensesRepository _repository;

  DeleteExpensesUseCase(this._repository);

  Future<Either<Failure, Unit>> call(int expensesId) async {
    return await _repository.deleteExpenses(expensesId);
  }
}