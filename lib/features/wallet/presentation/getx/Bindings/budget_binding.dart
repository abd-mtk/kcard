import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../../../app/utils/resources/services/budget_services.dart';
import '../../../data/repositories/budget_repository_implement.dart';
import '../../../domain/use cases/get_budget.dart';
import '../../../domain/use cases/update_budget.dart';
import '../controllers/budget_controller.dart';

class BudgetBinding extends Bindings {
  AppServices appServices = Get.find<AppServices>();
  BudgetServices budgetServices = Get.find<BudgetServices>();

  @override
  void dependencies() {
    Get.lazyPut<BudgetController>(() {
      final BudgetRepositoryImplement repository = BudgetRepositoryImplement(
          localDataSource: budgetServices.budgetLocalDataSource,
          networkInfo: appServices.networkInfo,
          remoteDataSource: budgetServices.budgetRemoteDataSource);

      return BudgetController(
          getBudgetUseCase: GetBudgetUseCase(repository),
          updateBudgetUseCase: UpdateBudgetUseCase(repository));
    });
  }
}
