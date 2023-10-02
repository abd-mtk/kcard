import '../../domain/entities/passwor_reset.dart';

class PasswordResetModel extends PasswordReset{
  PasswordResetModel({required super.password, required super.code});

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'code': code,
    };
  }

}