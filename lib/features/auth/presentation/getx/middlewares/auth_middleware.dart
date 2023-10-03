import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/resources/services.dart';
import '../../../../user/presentation/screens/home_screen.dart';
import '../../../data/data sources/local/auth_local_data_source.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  // ignore: overridden_fields
  int? priority = 0;
  Services services = Get.find<Services>();

  @override
  RouteSettings? redirect(String? route) {
    if (services.sharedPreferences.getString(cachedAuthUser) != null) {
      return const RouteSettings(name: HomeScreen.routeName);
    } else {
      return null;
    }
  }
}
