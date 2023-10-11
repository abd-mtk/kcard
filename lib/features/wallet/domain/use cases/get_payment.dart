import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/payment.dart';
import '../repositories/payment_repositories.dart';

class GetPaymentUseCase {
  final PaymentRepository _repository;

  GetPaymentUseCase(this._repository);

  Future<Either<Failure, List<Payment>>> call() async {
    return await _repository.getPayment();
  }
}
