import '../../domain/entities/login_data.dart';

class LoginDataModel extends LoginData {
  LoginDataModel(
      {required super.data,
      required super.success,
      required super.message,
      required super.validationErrors});

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      data: json['data'],
      success: json['success'],
      message: json['message'],
      validationErrors: json['validationErrors'],
    );
  }

  

  
}
