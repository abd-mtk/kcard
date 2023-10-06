import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../../domain/entities/expenses.dart';
import '../../domain/repositories/expenses_repositories.dart';

class ExpensesRepositoryimplement implements ExpensesRepository {
  @override
  Future<Either<Failure, Unit>> addExpenses(Expenses expenses) {
    // TODO: implement addExpenses
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteExpenses(String expensesId) {
    // TODO: implement deleteExpenses
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Expenses>>> getExpenses() {
    // TODO: implement getExpenses
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateExpenses(Expenses expenses) {
    // TODO: implement updateExpenses
    throw UnimplementedError();
  }
}
