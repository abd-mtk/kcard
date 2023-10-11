import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/payment.dart';
import '../repositories/payment_repositories.dart';

class AddPaymenUseCase {
  final PaymentRepository _repository;

  AddPaymenUseCase(this._repository);

  Future<Either<Failure, Unit>> call(Payment params) async {
    return await _repository.addPayment(params);
  }
}
