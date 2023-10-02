import '../../domain/entities/login.dart';

class LoginModel extends Login {
  LoginModel({required super.username, required super.password});

  Map<String, dynamic> toJson() {
    return {
      'email': username,
      'password': password,
    };
  }
}
