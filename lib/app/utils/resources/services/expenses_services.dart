import 'package:get/get.dart';

import '../../../../features/wallet/data/data sources/local/ecpenses_local_data_source.dart';
import '../../../../features/wallet/data/data sources/remote/expenses_remote_data_source.dart';
import 'app_services.dart';

class ExpensesServices extends GetxService {
  late final ExpensesLocalDataSource expensesLocalDataSource;
  late final ExpensesRemoteDataSource expensesRemoteDataSource;
  AppServices appServices = Get.find<AppServices>();

  Future<ExpensesServices> init() async {
    expensesLocalDataSource = ExpensesLocalDataSourceImplement(
        sharedPreferences: appServices.sharedPreferences);
    expensesRemoteDataSource = ExpensesRemoteDataSourceImplement();
    return this;
  }
}
