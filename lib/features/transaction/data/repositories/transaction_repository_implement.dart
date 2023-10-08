import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../../../../app/utils/resources/services/network_info.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transsaction_repositories.dart';
import '../data sources/local/trnsaction_local_data_source.dart.dart';
import '../data sources/remote/transaction_remote_data_source.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryimplement implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;
  final TransactionLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TransactionRepositoryimplement({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> createTransaction(
      Transaction transaction) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource
            .createTransaction(TransactionModel.fromEntity(transaction));
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTransaction(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteTransaction(id);
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() async {
    if (await networkInfo.isConnected) {
      try {
        final transactions = await remoteDataSource.getTransactions();
        return Right(transactions);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      try {
        final transactions = await localDataSource.getTransactions();
        return Right(transactions);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTransaction(
      Transaction transaction) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource
            .updateTransaction(TransactionModel.fromEntity(transaction));
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
