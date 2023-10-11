import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../data/data sources/local/pyment_local_data_source.dart';
import '../../../data/data sources/remote/Payment_remote_data_source.dart';
import '../../../data/repositories/pyment_repository_implement.dart';
import '../../../domain/use cases/add_payment.dart';
import '../../../domain/use cases/delete_payment.dart';
import '../../../domain/use cases/get_payment.dart';
import '../../../domain/use cases/update_payment.dart';
import '../controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  // PaymentServices PaymentServices = Get.find<PaymentServices>();
  AppServices appServices = Get.find<AppServices>();
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() {
      final PaymentRepositoryimplement repository =
          PaymentRepositoryimplement(
              localDataSource: PaymentLocalDataSourceImplement(
                  sharedPreferences: appServices.sharedPreferences),
              networkInfo: appServices.networkInfo,
              remoteDataSource: PaymentRemoteDataSourceImplement(
                uid: FirebaseAuth.instance.currentUser!.uid,
              ));
      return PaymentController(
        getPaymentUseCase: GetPaymentUseCase (repository),
        addPaymentUseCase: AddPaymenUseCase (repository),
        deletePaymentUseCase: DeletePaymentUseCase(repository),
        updatePaymentUseCase: UpdatePaymentUseCase(repository),
      );
    });
  }
}
