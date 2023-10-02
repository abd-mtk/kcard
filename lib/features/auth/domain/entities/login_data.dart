import 'data.dart';

class LoginData {
  final Data data;
  final bool success;
  final String message;
  final dynamic validationErrors;

  LoginData({
    required this.data,
    required this.success,
    required this.message,
    required this.validationErrors,
  });
}


