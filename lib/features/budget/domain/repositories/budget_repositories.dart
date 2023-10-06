import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/budget.dart';

abstract class BudgetRepository {
  Future<Either<Failure, Budget>> getBudget();
  Future<Either<Failure, Unit>> updateBudget(Budget budget);
}
