import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/payment.dart';
import '../repositories/payment_repositories.dart';

class UpdatePaymentUseCase {
  final PaymentRepository _repository;

  UpdatePaymentUseCase(this._repository);

  Future<Either<Failure, Unit>> call(Payment payment) async {
    return await _repository.updatePayment(payment);
  }
}
