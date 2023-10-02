import '../../domain/entities/register_data.dart';

class RegisterDataModel extends RegisterData {
  RegisterDataModel(
      {required super.data,
      required super.success,
      required super.message,
      required super.validationErrors});

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterDataModel(
      data: json['data'],
      success: json['success'],
      message: json['message'],
      validationErrors: json['validationErrors'],
    );
  }

  
}