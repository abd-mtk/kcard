import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../repositories/payment_repositories.dart';

class DeletePaymentUseCase {
  final PaymentRepository _repository;

  DeletePaymentUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String paymentId) async {
    return await _repository.deletePayment(paymentId);
  }
}
