import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/transaction.dart';
import '../repositories/transsaction_repositories.dart';

class CreateTrnsctionsUseCase {
  final TransactionRepository _repository;

  CreateTrnsctionsUseCase(this._repository);

  Future<Either<Failure, Unit>> call(Transaction transaction) async {
    return await _repository.createTransaction(transaction);
  }
}
