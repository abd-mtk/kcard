import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../data/data sources/local/budget_local_data_source.dart';
import '../../../data/data sources/remote/budget_remote_data_source.dart';
import '../../../data/repositories/budget_repository_implement.dart';
import '../../../domain/use cases/get_budget.dart';
import '../../../domain/use cases/update_budget.dart';
import '../controllers/budget_controller.dart';

class BudgetBinding extends Bindings {
  AppServices appServices = Get.find<AppServices>();
  // BudgetServices budgetServices = Get.find<BudgetServices>();

  @override
  void dependencies() {
    // print('BudgetBinding');
    Get.lazyPut<BudgetController>(() {
      final BudgetRepositoryImplement repository = BudgetRepositoryImplement(
        localDataSource: BudgetLocalDataSourceImplement(
            sharedPreferences: appServices.sharedPreferences),
        networkInfo: appServices.networkInfo,
        remoteDataSource: BudgetRemoteDataSourceImplement(
            uid: FirebaseAuth.instance.currentUser!.uid),
      );
 
      return BudgetController(
          getBudgetUseCase: GetBudgetUseCase(repository),
          updateBudgetUseCase: UpdateBudgetUseCase(repository));
    });
  }
}
