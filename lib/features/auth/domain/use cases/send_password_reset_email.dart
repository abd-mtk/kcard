import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../repositories/auth_repositories.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepositories repository;

  SendPasswordResetEmailUseCase({required this.repository});

  Future<Either<AuthFailure, Unit>> call(String email) async {
    return await repository.sendPasswordResetEmail(email);
  }
}
