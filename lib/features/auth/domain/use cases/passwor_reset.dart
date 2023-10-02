import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/passwor_reset.dart';
import '../repositories/auth_repositories.dart';

class PasswordResetUseCase {
  final AuthRepositories repository;

  PasswordResetUseCase({required this.repository});

  Future<Either<AuthFailure, Unit>> call(PasswordReset passwordReset) async {
    return await repository.passwordReset(passwordReset);
  }
}
