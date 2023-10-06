import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../../home/screens/home_screen.dart';
import '../../../data/data sources/local/auth_local_data_source.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  // ignore: overridden_fields
  int? priority = 0;
  AppServices appservices = Get.find<AppServices>();

  @override
  RouteSettings? redirect(String? route) {
    if (appservices.sharedPreferences.getString(cachedAuthUser) != null) {
      return const RouteSettings(name: HomeScreen.routeName);
    } else {
      return null;
    }
  }
}
