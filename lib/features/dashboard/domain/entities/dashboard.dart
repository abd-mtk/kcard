import '../../../transaction/domain/entities/transaction.dart';
import '../../../wallet/domain/entities/budget.dart';
import '../../../wallet/domain/entities/payment.dart';

class Dashboard {
  final Budget? budget;
  final List<Payment>? payment;
  final List<Transaction>? transaction;

  Dashboard({
     this.budget,
     this.payment,
     this.transaction,
  });
}
