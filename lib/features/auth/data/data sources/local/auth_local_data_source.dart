import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:kcard/features/auth/domain/entities/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../app/errors/auth/excptions.dart';
import '../../../domain/entities/user.dart';
import '../../models/auth_model.dart';
import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<Unit> cacheAuthUser(AuthModel user);
  Future<Unit> cacheUser(UserModel user);
  Future<Unit> deleteAuthUser();
  Future<Unit> deleteUser();
  Future<Auth> getAuthUser();
  Future<User> getUser();
}

const String cachedAuthUser = "CACHED_AUTH_USER";
const String cachedUser = "CACHED_USER";

class LocalDataSourceImplement implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  const LocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<Unit> cacheAuthUser(AuthModel auth) {
    sharedPreferences.setString(cachedAuthUser, json.encode(auth.toJson()));
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheUser(UserModel user) {
    sharedPreferences.setString(cachedUser, json.encode(user.toJson()));
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteAuthUser() {
    sharedPreferences.remove(cachedAuthUser);
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteUser() {
    sharedPreferences.remove(cachedUser);
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

  @override
  Future<User> getUser() {
    final user = sharedPreferences.getString(cachedUser);
    if (user != null) {
      return Future.value(UserModel.fromJson(json.decode(user)));
    } else {
      throw EmptyCacheException();
    }
  }
}
