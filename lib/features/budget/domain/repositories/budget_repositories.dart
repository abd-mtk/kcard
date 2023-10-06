import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/budget/failures.dart';
import '../entities/budget.dart';

abstract class BudgetRepository {
  Future<Either<BudgetFailure, Budget>> getBudget();
  Future<Either<BudgetFailure, Unit>> updateBudget(Budget budget);
}
