import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../../../../app/utils/resources/services/network_info.dart';
import '../../domain/entities/budget.dart';
import '../../domain/repositories/budget_repositories.dart';
import '../data sources/local/budget_local_data_source.dart';
import '../data sources/remote/budget_remote_data_source.dart';
import '../models/budget_model.dart';

class BudgetRepositoryImplement implements BudgetRepository {
  final BudgetRemoteDataSource remoteDataSource;
  final BudgetLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  BudgetRepositoryImplement({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Budget>> getBudget() async {
    if (await networkInfo.isConnected) {
      try {
        final Budget budget = await remoteDataSource.getBudget();
        localDataSource.cacheBudget(BudgetModel(
          currentBudget: budget.currentBudget,
          expenses: budget.expenses,
          income: budget.income,
          debt: budget.debt,
        ));
        return Right(budget);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(await localDataSource.getBudget());
      } catch (e) {
        return Left(InternetConnectionFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updateBudget(Budget budget) async {
    if (await networkInfo.isConnected) {
      try {
        remoteDataSource.updateBudget(BudgetModel(
          currentBudget: budget.currentBudget,
          expenses: budget.expenses,
          income: budget.income,
          debt: budget.debt,
        ));
        localDataSource.cacheBudget(BudgetModel(
          currentBudget: budget.currentBudget,
          expenses: budget.expenses,
          income: budget.income,
          debt: budget.debt,
        ));
        return const Right(unit);
      } catch (e) {
        return Left(UpdateNetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
