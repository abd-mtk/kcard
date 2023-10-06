import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../../../../app/utils/resources/services/network_info.dart';
import '../../domain/entities/expenses.dart';
import '../../domain/repositories/expenses_repositories.dart';
import '../data sources/local/ecpenses_local_data_source.dart';
import '../data sources/remote/expenses_remote_data_source.dart';
import '../models/expenses_model.dart';

class ExpensesRepositoryimplement implements ExpensesRepository {
  final ExpensesRemoteDataSource remoteDataSource;
  final ExpensesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ExpensesRepositoryimplement({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> addExpenses(Expenses expenses) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addExpenses(ExpensesModel(
          name: expenses.name,
          amount: expenses.amount,
          date: expenses.date,
          category: expenses.category,
          note: expenses.note,
        ));
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteExpenses(String expensesId) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteExpenses(expensesId);
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Expenses>>> getExpenses() async {
    if (await networkInfo.isConnected) {
      try {
        final expenses = await remoteDataSource.getExpenses();
        localDataSource.cacheExpenses(expenses
            .map((e) => ExpensesModel(
                  name: e.name,
                  amount: e.amount,
                  date: e.date,
                  category: e.category,
                  note: e.note,
                ))
            .toList());
        return Right(expenses);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      try {
        return Right(await localDataSource.getExpenses());
      } catch (e) {
        return Left(InternetConnectionFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updateExpenses(Expenses expenses) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateExpenses(ExpensesModel(
          name: expenses.name,
          amount: expenses.amount,
          date: expenses.date,
          category: expenses.category,
          note: expenses.note,
        ));
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
