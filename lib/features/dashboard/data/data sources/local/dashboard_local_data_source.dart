import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../app/errors/excptions.dart';
import '../../../domain/entities/dashboard.dart';
import '../../models/dashboard_model.dart';

abstract class DashboardLocalDataSource {
  Future<Dashboard> getDashboard();
  Future<Unit> cacheDashboard(DashboardModel dashboardToCache);
}

const String CACHED_DASHBOARD = 'CACHED_DASHBOARD';

class DashboardLocalDataSourceImplement implements DashboardLocalDataSource {
  final SharedPreferences sharedPreferences;

  DashboardLocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<Unit> cacheDashboard(DashboardModel dashboardToCache) {
    sharedPreferences.setString(
      CACHED_DASHBOARD,
      json.encode(dashboardToCache.toJson()),
    );
    return Future.value(unit);
  }

  @override
  Future<Dashboard> getDashboard() {
    final jsonString = sharedPreferences.getString(CACHED_DASHBOARD);
    if (jsonString != null) {
      return Future.value(DashboardModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
