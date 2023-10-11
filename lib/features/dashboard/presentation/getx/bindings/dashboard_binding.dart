import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../data/data sources/local/dashboard_local_data_source.dart';
import '../../../data/data sources/remote/dashboard_remote_data_source.dart';
import '../../../data/repositories/dashboard_repositore_implement.dart';
import '../../../domain/use cases/get_dashboard.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBindging extends Bindings {
  AppServices appServices = Get.find<AppServices>();
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() {
      final DashboardRepositoreImplement repository =
          DashboardRepositoreImplement(
        localDataSource: DashboardLocalDataSourceImplement(
          sharedPreferences: appServices.sharedPreferences,
        ),
        networkInfo: appServices.networkInfo,
        remoteDataSource: DashboardRemoteDataSourceImplement(
            uid: FirebaseAuth.instance.currentUser!.uid),
      );
      return DashboardController(
        getDashboardUsecase: GetDashboardUseCase(repository),
      );
    });
  }
}
