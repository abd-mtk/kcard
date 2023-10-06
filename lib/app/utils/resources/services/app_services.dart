import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network_info.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late NetworkInfoImplement networkInfo;

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    networkInfo = NetworkInfoImplement(InternetConnectionChecker());
    return this;
  }
}
