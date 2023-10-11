import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../../../../app/utils/resources/services/network_info.dart';
import '../../domain/entities/payment.dart';
import '../../domain/repositories/payment_repositories.dart';
import '../data sources/local/pyment_local_data_source.dart';
import '../data sources/remote/Payment_remote_data_source.dart';
import '../models/payment_model.dart';

class PaymentRepositoryimplement implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;
  final PaymentsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PaymentRepositoryimplement({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> addPayment(Payment payment) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.addPayment(PaymentModel(
          title: payment.title,
          value: payment.value,
          date: payment.date,
          category: payment.category,
          note: payment.note,
        ));
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePayment(String paymentId) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deletePayment(paymentId);
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Payment>>> getPayment() async {
    if (await networkInfo.isConnected) {
      try {
        final List<Payment> payment = await remoteDataSource.getPayment();
        List<PaymentModel> paymentModel = [];
        for (var element in payment) {
          paymentModel.add(PaymentModel(
            id: element.id,
            title: element.title,
            value: element.value,
            date: element.date,
            category: element.category,
            note: element.note,
          ));
        }
        localDataSource.cachePayment(paymentModel);
        return Right(payment);
      } catch (e) {
        return Left(GetNetworkFailure());
      }
    } else {
      try {
        return Right(await localDataSource.getPayment());
      } catch (e) {
        return Left(InternetConnectionFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> updatePayment(Payment Payment) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updatePayment(PaymentModel(
          title: Payment.title,
          value: Payment.value,
          date: Payment.date,
          category: Payment.category,
          note: Payment.note,
        ));
        return const Right(unit);
      } catch (e) {
        return Left(NetworkFailure());
      }
    } else {
      return Left(InternetConnectionFailure());
    }
  }
}
