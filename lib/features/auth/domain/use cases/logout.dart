import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../repositories/auth_repositories.dart';

class LogOutUseCase {
  final AuthRepositories repository;

  LogOutUseCase({required this.repository});

  Future<Either<AuthFailure, Unit>> call() async {
    return await repository.logOut();
  }
}
