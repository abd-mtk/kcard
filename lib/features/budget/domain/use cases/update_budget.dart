import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/budget/failures.dart';
import '../entities/budget.dart';
import '../repositories/budget_repositories.dart';

class UpdateBudgetUseCase {
  final BudgetRepository _repository;

  UpdateBudgetUseCase(this._repository);

  Future<Either<BudgetFailure, Unit>> call(Budget params) async {
    return await _repository.updateBudget(params);
  }
}
