import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/budget/failures.dart';
import '../entities/expenses.dart';

abstract class ExpensesRepository {
  Future<Either<ExpensesFailure, List<Expenses>>> getExpenses();
  Future<Either<ExpensesFailure, Unit>> addExpenses(Expenses expenses);
  Future<Either<ExpensesFailure, Unit>> updateExpenses(int expensesId);
  Future<Either<ExpensesFailure, Unit>> deleteExpenses(int expensesId);
}
