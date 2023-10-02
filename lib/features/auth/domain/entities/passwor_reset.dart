import 'package:equatable/equatable.dart';

class PasswordReset extends Equatable {
  final String password;
  final String code;

  const PasswordReset({
    required this.password,
    required this.code,
  });

  @override
  List<Object?> get props => [password, code];
}
