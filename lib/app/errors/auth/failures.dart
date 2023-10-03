import 'package:equatable/equatable.dart';

abstract class AuthFailure extends Equatable {}

class NetworkFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthServerFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthEmptyCacheFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthWeakPasswordFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthEmailAlreadyInUseFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthInvalidEmailFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthWrongPasswordFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthEmailNotVerifiedFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AddUserInfoFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class DeleteUserInfoFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class UpdateUserInfoFailure extends AuthFailure {
  @override
  List<Object?> get props => [];
}
