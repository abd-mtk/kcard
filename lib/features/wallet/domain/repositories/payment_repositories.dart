import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/payment.dart';

abstract class PaymentRepository {
  Future<Either<Failure, List<Payment>>> getPayment();
  Future<Either<Failure, Unit>> addPayment(Payment payment);
  Future<Either<Failure, Unit>> updatePayment(Payment payment);
  Future<Either<Failure, Unit>> deletePayment(String paymentId);
}
