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
          title: expenses.title,
          value: expenses.value,
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
        final List<Expenses> expenses = await remoteDataSource.getExpenses();
        List<ExpensesModel> expensesModel = [];
        for (var element in expenses) {
          expensesModel.add(ExpensesModel(
            id: element.id,
            title: element.title,
            value: element.value,
            date: element.date,
            category: element.category,
            note: element.note,
          ));
        }
        localDataSource.cacheExpenses(expensesModel);
        return Right(expenses);
      } catch (e) {
        return Left(GetNetworkFailure());
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
          title: expenses.title,
          value: expenses.value,
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
