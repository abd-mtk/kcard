import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../repositories/auth_repositories.dart';

class PasswordCheckUseCase {
  final AuthRepositories repository;

  PasswordCheckUseCase({required this.repository});

  Future<Either<AuthFailure, Unit>> call(String password) async {
    return await repository.passwordCheck(password);
  }
}
