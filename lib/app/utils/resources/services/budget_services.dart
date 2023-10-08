import 'package:get/get.dart';

import '../../../../features/wallet/data/data sources/local/budget_local_data_source.dart';
import '../../../../features/wallet/data/data sources/remote/budget_remote_data_source.dart';
import 'app_services.dart';

class BudgetServices extends GetxService {
  late final BudgetLocalDataSource budgetLocalDataSource;
  late final BudgetRemoteDataSource budgetRemoteDataSource;
  AppServices appServices = Get.find<AppServices>();

  Future<BudgetServices> init() async {
    budgetLocalDataSource = BudgetLocalDataSourceImplement(
        sharedPreferences: appServices.sharedPreferences);
    budgetRemoteDataSource = BudgetRemoteDataSourceImplement(uid: appServices.uid);
    return this;
  }
}
