import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../data/data sources/local/ecpenses_local_data_source.dart';
import '../../../data/data sources/remote/expenses_remote_data_source.dart';
import '../../../data/repositories/expenses_repository_implement.dart';
import '../../../domain/use cases/add_expenses.dart';
import '../../../domain/use cases/delete_expenses.dart';
import '../../../domain/use cases/get_expenses.dart';
import '../../../domain/use cases/update_expenses.dart';
import '../controllers/expenses_controller.dart';

class ExpensesBinding extends Bindings {
  // ExpensesServices expensesServices = Get.find<ExpensesServices>();
  AppServices appServices = Get.find<AppServices>();
  @override
  void dependencies() {
    Get.lazyPut<ExpensesController>(() {
      final ExpensesRepositoryimplement repository =
          ExpensesRepositoryimplement(
              localDataSource: ExpensesLocalDataSourceImplement(
                  sharedPreferences: appServices.sharedPreferences),
              networkInfo: appServices.networkInfo,
              remoteDataSource: ExpensesRemoteDataSourceImplement(
                uid: FirebaseAuth.instance.currentUser!.uid,
              ));
      return ExpensesController(
        getExpensesUseCase: GetExpensesUseCase(repository),
        addExpensesUseCase: AddExpensesUseCase(repository),
        deleteExpensesUseCase: DeleteExpensesUseCase(repository),
        updateExpensesUseCase: UpdateExpensesUseCase(repository),
      );
    });
  }
}
