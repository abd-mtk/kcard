import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../../wallet/data/data sources/local/budget_local_data_source.dart';
import '../../../../wallet/data/data sources/local/ecpenses_local_data_source.dart';
import '../../../../wallet/data/data sources/remote/budget_remote_data_source.dart';
import '../../../../wallet/data/data sources/remote/expenses_remote_data_source.dart';
import '../../../../wallet/data/repositories/budget_repository_implement.dart';
import '../../../../wallet/data/repositories/expenses_repository_implement.dart';
import '../../../../wallet/domain/use cases/get_budget.dart';
import '../../../../wallet/domain/use cases/get_expenses.dart';
import '../controllers/wallet_charts_controller.dart';

class WalletChartsBinding extends Bindings {
  AppServices appServices = Get.find<AppServices>();

  @override
  void dependencies() {
    Get.lazyPut<WalletChartsController>(() {
      final BudgetRepositoryImplement budgetrepository =
          BudgetRepositoryImplement(
        localDataSource: BudgetLocalDataSourceImplement(
            sharedPreferences: appServices.sharedPreferences),
        networkInfo: appServices.networkInfo,
        remoteDataSource: BudgetRemoteDataSourceImplement(
            uid: FirebaseAuth.instance.currentUser!.uid),
      );

      final ExpensesRepositoryimplement expenserepository =
          ExpensesRepositoryimplement(
              localDataSource: ExpensesLocalDataSourceImplement(
                  sharedPreferences: appServices.sharedPreferences),
              networkInfo: appServices.networkInfo,
              remoteDataSource: ExpensesRemoteDataSourceImplement(
                uid: FirebaseAuth.instance.currentUser!.uid,
              ));

      return WalletChartsController(
          getBudgetUseCase: GetBudgetUseCase(budgetrepository),
          getExpensesUseCase: GetExpensesUseCase(expenserepository));
    });
  }
}
