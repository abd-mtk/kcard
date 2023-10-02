import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/auth.dart';
import '../entities/user.dart';
import '../repositories/auth_repositories.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<AuthFailure, User>> call(Auth params) async {
    return await repository.register(params);
  }
}
