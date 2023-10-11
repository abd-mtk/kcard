import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../../transaction/data/data sources/local/trnsaction_local_data_source.dart.dart';
import '../../../../transaction/data/data sources/remote/transaction_remote_data_source.dart';
import '../../../../transaction/data/repositories/transaction_repository_implement.dart';
import '../../../../transaction/domain/use cases/get_transactions.dart';
import '../controllers/transaction_chart_controller.dart';

class TransactionChartsBinding extends Bindings {
  AppServices appServices = Get.find<AppServices>();
  @override
  void dependencies() {
    Get.lazyPut<TransactionChartsController>(
      () {
        final TransactionRepositoryImplement repository =
            TransactionRepositoryImplement(
                localDataSource: TransactionLocalDataSourceImplement(
                    sharedPreferences: appServices.sharedPreferences),
                networkInfo: appServices.networkInfo,
                remoteDataSource: TransactionRemoteDataSourceImplement(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                ));
        return TransactionChartsController(
          getTransactionsUseCase: GetTrnsactionsUseCase(repository),
        );
      },
    );
  }
}
