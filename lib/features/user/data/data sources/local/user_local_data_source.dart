import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../app/errors/auth/excptions.dart';
import '../../../domain/entities/user.dart';
import '../../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<Unit> cacheUser(UserModel user);
  Future<Unit> deleteUser();
  Future<User> getUser();
}

const String cachedUser = "CACHED_USER";

class LocalDataSourceImplement implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  const LocalDataSourceImplement({required this.sharedPreferences});



  @override
  Future<Unit> cacheUser(UserModel user) {
    sharedPreferences.setString(cachedUser, json.encode(user.toJson()));
    return Future.value(unit);
  }

 
  @override
  Future<Unit> deleteUser() {
    sharedPreferences.remove(cachedUser);
    return Future.value(unit);
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
