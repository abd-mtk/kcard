import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../app/errors/auth/excptions.dart';
import '../../../domain/entities/user.dart';
import '../../models/user_model.dart';

abstract class LocalDataSource {
  Future<Unit> cacheUser(UserModel user);
  Future<Unit> deleteUser();
  Future<User> getUser();
}

const String CACHED_USER = "CACHED_USER";

class LocalDataSourceImplement implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  const LocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<Unit> cacheUser(UserModel user) {
    sharedPreferences.setString(CACHED_USER, json.encode(user.toJson()));
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteUser() {
    sharedPreferences.remove(CACHED_USER);
    return Future.value(unit);
  }

  @override
  Future<User> getUser() {
    final user = sharedPreferences.getString(CACHED_USER);
    if (user != null) {
      return Future.value(UserModel.fromJson(json.decode(user)));
    } else {
      throw EmptyCacheException();
    }
  }
}
