import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class InternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SaveNetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class DeleteNetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class GetNetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UpdateNetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoDataNetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class SaveCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}
