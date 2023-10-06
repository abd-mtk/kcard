import 'package:get/get.dart';


import '../../../../features/auth/data/data sources/local/auth_local_data_source.dart';
import '../../../../features/auth/data/data sources/remote/auth_remot_data_source.dart';
import 'app_services.dart';

class AuthServices extends GetxService {
  late AuthRemoteDataSource remoteDataSource;
  late AuthLocalDataSource localDataSource;
  AppServices appServices = Get.find<AppServices>();

  Future<AuthServices> init() async {
    localDataSource = LocalDataSourceImplement(
        sharedPreferences: appServices.sharedPreferences);
    remoteDataSource = const RemoteDataSourceImplement();
    return this;
  }
}
