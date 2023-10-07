import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/expenses.dart';
import '../repositories/expenses_repositories.dart';

class UpdateExpensesUseCase {
  final ExpensesRepository _repository;

  UpdateExpensesUseCase(this._repository);

  Future<Either<Failure, Unit>> call(Expenses expenses) async {
    return await _repository.updateExpenses(expenses);
  }
}
