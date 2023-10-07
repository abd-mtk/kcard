import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../../../app/utils/resources/services/expenses_services.dart';
import '../../../data/repositories/expenses_repository_implement.dart';
import '../../../domain/use cases/add_expenses.dart';
import '../../../domain/use cases/delete_expenses.dart';
import '../../../domain/use cases/get_expenses.dart';
import '../../../domain/use cases/update_expenses.dart';
import '../controllers/expenses_controller.dart';

class ExpensesBinding extends Bindings {
  ExpensesServices expensesServices = Get.find<ExpensesServices>();
  AppServices appServices = Get.find<AppServices>();
  @override
  void dependencies() {
    Get.lazyPut<ExpensesController>(() {
      final ExpensesRepositoryimplement repository =
          ExpensesRepositoryimplement(
              localDataSource: expensesServices.expensesLocalDataSource,
              networkInfo: appServices.networkInfo,
              remoteDataSource: expensesServices.expensesRemoteDataSource);
      return ExpensesController(
        getExpensesUseCase: GetExpensesUseCase(repository),
        addExpensesUseCase: AddExpensesUseCase(repository),
        deleteExpensesUseCase: DeleteExpensesUseCase(repository),
        updateExpensesUseCase: UpdateExpensesUseCase(repository),
      );
    });
  }
}
