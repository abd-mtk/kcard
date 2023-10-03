import '../../domain/entities/auth.dart';

class AuthModel extends Auth{
  const AuthModel({required super.email, required super.password});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

}