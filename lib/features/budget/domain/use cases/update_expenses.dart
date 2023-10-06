import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/budget/failures.dart';
import '../repositories/expenses_repositories.dart';

class UpdateExpensesUseCase {
  final ExpensesRepository _repository;

  UpdateExpensesUseCase(this._repository);

  Future<Either<ExpensesFailure, Unit>> call(int expensesId) async {
    return await _repository.updateExpenses(expensesId);
  }
}
