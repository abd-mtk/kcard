import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../repositories/auth_repositories.dart';

class VerifyPasswordResetCodeUseCase {
  final AuthRepositories repository;

  VerifyPasswordResetCodeUseCase({required this.repository});

  Future<Either<AuthFailure, Unit>> call(String code) async {
    return await repository.verifyPasswordResetCode(code);
  }
}
