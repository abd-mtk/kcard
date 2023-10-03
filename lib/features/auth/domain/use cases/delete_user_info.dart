import 'package:fpdart/fpdart.dart';
import 'package:kcard/app/errors/auth/failures.dart';

import '../entities/user.dart';
import '../repositories/auth_repositories.dart';

class DeleteUserInformationUseCase {
  final AuthRepository repository;

  DeleteUserInformationUseCase(this.repository);

  Future<Either<AuthFailure, Unit>> call(User params) async {
    return await repository.deleteUserInformation(params);
  }
}
