import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/expenses.dart';

abstract class ExpensesRepository {
  Future<Either<Failure, List<Expenses>>> getExpenses();
  Future<Either<Failure, Unit>> addExpenses(Expenses expenses);
  Future<Either<Failure, Unit>> updateExpenses(Expenses expenses);
  Future<Either<Failure, Unit>> deleteExpenses(int expensesId);
}
