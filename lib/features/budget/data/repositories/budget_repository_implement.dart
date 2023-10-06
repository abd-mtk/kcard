import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../../domain/entities/budget.dart';
import '../../domain/repositories/budget_repositories.dart';

class BudgetRepositoryImplement implements BudgetRepository {
  @override
  Future<Either<Failure, Budget>> getBudget() {
    // TODO: implement getBudget
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateBudget(Budget budget) {
    // TODO: implement updateBudget
    throw UnimplementedError();
  }
}
