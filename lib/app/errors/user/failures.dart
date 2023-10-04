import 'package:equatable/equatable.dart';

abstract class UserFailure extends Equatable {}

class NetworkFailure extends UserFailure {
  @override
  List<Object?> get props => [];
}

class UserServerFailure extends UserFailure {
  @override
  List<Object?> get props => [];
}

class UserEmptyCacheFailure extends UserFailure {
  @override
  List<Object?> get props => [];
}

class AddUserInfoFailure extends UserFailure {
  @override
  List<Object?> get props => [];
}

class DeleteUserInfoFailure extends UserFailure {
  @override
  List<Object?> get props => [];
}

class UpdateUserInfoFailure extends UserFailure {
  @override
  List<Object?> get props => [];
}

class GetUserInformationFailure extends UserFailure {
  @override
  List<Object?> get props => [];
}
