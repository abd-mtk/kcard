import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/auth.dart';
import '../entities/user.dart';
import '../repositories/auth_repositories.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Either<AuthFailure, User>> call(Auth params) async {
    return await _authRepository.login(params);
  }
}