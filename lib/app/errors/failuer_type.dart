import 'package:equatable/equatable.dart';

class FailureType extends Equatable {
  final String message;

  const FailureType({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  String toString() => message;

  factory FailureType.serverError() {
    return const FailureType(message: 'Server Error');
  }

  factory FailureType.cacheError() {
    return const FailureType(message: 'Cache Error');
  }

  factory FailureType.networkError() {
    return const FailureType(message: 'Network Error');
  }

  factory FailureType.unauthorized() {
    return const FailureType(message: 'Unauthorized');
  }

  factory FailureType.notFound() {
    return const FailureType(message: 'Not Found');
  }



}