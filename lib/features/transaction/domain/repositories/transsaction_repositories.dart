import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<Transaction>>> getTransactions();
  Future<Either<Failure, Unit>> createTransaction(Transaction transaction);
  Future<Either<Failure, Unit>> deleteTransaction(String id);
  Future<Either<Failure, Unit>> updateTransaction(Transaction transaction);
}
