import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network_info.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late NetworkInfoImplement networkInfo;
  // late String uid;

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    networkInfo = NetworkInfoImplement(InternetConnectionChecker());
    // try {
    //   uid = FirebaseAuth.instance.currentUser!.uid;
    // } catch (e) {
    //   if (kDebugMode) {
    //     print("AppServices init error: $e");
    //   }
    // }
    return this;
  }
}
