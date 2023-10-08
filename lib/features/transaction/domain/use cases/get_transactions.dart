import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/transaction.dart';
import '../repositories/transsaction_repositories.dart';

class GetTrnsctionsUseCase {
  final TransactionRepository _repository;

  GetTrnsctionsUseCase(this._repository);

  Future<Either<Failure, List<Transaction>>> call() async {
    return await _repository.getTransactions();
  }
}
