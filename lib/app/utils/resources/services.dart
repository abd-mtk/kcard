import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/auth/data/data sources/local/auth_local_data_source.dart';
import '../../../features/auth/data/data sources/remote/auth_remot_data_source.dart';
import 'network_info.dart';

class Services extends GetxService {
  late SharedPreferences sharedPreferences;
  late NetworkInfoImplement networkInfo;
  late AuthRemoteDataSource remoteDataSource;
  late AuthLocalDataSource localDataSource;

  Future<Services> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    localDataSource =
        LocalDataSourceImplement(sharedPreferences: sharedPreferences);
    networkInfo = NetworkInfoImplement(InternetConnectionChecker());
    remoteDataSource = const RemoteDataSourceImplement();
    return this;
  }
}
