import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../app/errors/auth/excptions.dart';
import '../../../domain/entities/auth.dart';
import '../../models/auth_model.dart';

abstract class AuthLocalDataSource {
  Future<Unit> cacheAuthUser(AuthModel user);
  Future<Unit> deleteAuthUser();
  Future<Auth> getAuthUser();
}

const String cachedAuthUser = "CACHED_AUTH_USER";

class LocalDataSourceImplement implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  const LocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<Unit> cacheAuthUser(AuthModel auth) {
    sharedPreferences.setString(cachedAuthUser, json.encode(auth.toJson()));
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteAuthUser() {
    sharedPreferences.remove(cachedAuthUser);
    return Future.value(unit);
  }

  @override
  Future<Auth> getAuthUser() {
    final user = sharedPreferences.getString(cachedAuthUser);
    if (user != null) {
      return Future.value(AuthModel.fromJson(json.decode(user)));
    } else {
      throw EmptyCacheException();
    }
  }
}
