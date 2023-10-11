import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kcard/features/transaction/data/data%20sources/local/trnsaction_local_data_source.dart.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../data/data sources/remote/transaction_remote_data_source.dart';
import '../../../data/repositories/transaction_repository_implement.dart';
import '../../../domain/use cases/create_transaction.dart';
import '../../../domain/use cases/delete_transaction.dart';
import '../../../domain/use cases/get_transactions.dart';
import '../controllers/transaction_controller.dart';

class TransactionBinding extends Bindings {
  AppServices appServices = Get.find<AppServices>();
  // TransactionServices transitionServices = Get.find<TransactionServices>();
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(() {
      final TransactionRepositoryImplement repository =
          TransactionRepositoryImplement(
              localDataSource: TransactionLocalDataSourceImplement(
                  sharedPreferences: appServices.sharedPreferences),
              networkInfo: appServices.networkInfo,
              remoteDataSource: TransactionRemoteDataSourceImplement(
                uid: FirebaseAuth.instance.currentUser!.uid,
              ));
      return TransactionController(
        createTrnsctionsUseCase: CreateTrnsctionsUseCase(repository),
        deleteTrnsctionsUseCase: DeleteTrnsctionsUseCase(repository),
        getTrnsactionsUseCase: GetTrnsactionsUseCase(repository),
      );
    });
  }
}
