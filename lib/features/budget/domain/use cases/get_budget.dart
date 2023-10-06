import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/budget/failures.dart';
import '../entities/budget.dart';
import '../repositories/budget_repositories.dart';

class GetBudgetUseCase {
  final BudgetRepository _repository;
  GetBudgetUseCase(this._repository);

  Future<Either<BudgetFailure, Budget>> call() async {
    return await _repository.getBudget();
  }
}
