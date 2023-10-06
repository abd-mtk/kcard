import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/expenses.dart';
import '../repositories/expenses_repositories.dart';

class GetExpensesUseCase {
  final ExpensesRepository _repository;

  GetExpensesUseCase(this._repository);

  Future<Either<Failure, List<Expenses>>> call() async {
    return await _repository.getExpenses();
  }
}
