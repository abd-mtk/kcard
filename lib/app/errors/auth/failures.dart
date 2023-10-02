import 'package:equatable/equatable.dart';

abstract class AuthFailure extends Equatable {}

class AuthFailureServer extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureEmailAlreadyInUse extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureInvalidEmail extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureWrongPassword extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureUserNotFound extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureUserDisabled extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureTooManyRequests extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureOperationNotAllowed extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureWeakPassword extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureEmailNotVerified extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureInvalidCredential extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureAccountExistsWithDifferentCredential extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureInvalidVerificationCode extends AuthFailure {
  @override
  List<Object?> get props => [];
}

class AuthFailureInvalidPhoneNumber extends AuthFailure {
  @override
  List<Object?> get props => [];
}
