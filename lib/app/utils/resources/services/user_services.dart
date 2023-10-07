import 'package:get/get.dart';

import '../../../../features/user/data/data sources/local/user_local_data_source.dart';
import '../../../../features/user/data/data sources/remote/user_remot_data_source.dart';
import 'app_services.dart';

class UserServices extends GetxService {
  late UserRemoteDataSource userRemoteDataSource;
  late UserLocalDataSource userLocalDataSource;
  AppServices appServices = Get.find<AppServices>();

  Future<UserServices> init() async {
    userLocalDataSource = UserLocalDataSourceImplement(
        sharedPreferences: appServices.sharedPreferences);

    userRemoteDataSource = UserRemoteDataSourceImplement();
    return this;
  }
}
