import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../repositories/transsaction_repositories.dart';

class DeleteTrnsctionsUseCase {
  final TransactionRepository _repository;

  DeleteTrnsctionsUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String id) async {
    return await _repository.deleteTransaction(id);
  }
}
