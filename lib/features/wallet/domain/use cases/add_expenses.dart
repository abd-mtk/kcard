import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/expenses.dart';
import '../repositories/expenses_repositories.dart';

class AddExpensesUseCase {
  final ExpensesRepository _repository;

  AddExpensesUseCase(this._repository);

  Future<Either<Failure, Unit>> call(Expenses params) async {
    return await _repository.addExpenses(params);
  }
}
