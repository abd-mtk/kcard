import 'package:fpdart/fpdart.dart';
import 'package:kcard/app/errors/auth/failures.dart';

import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class DeleteUserInformationUseCase {
  final UserRepository repository;

  DeleteUserInformationUseCase(this.repository);

  Future<Either<AuthFailure, Unit>> call(User params) async {
    return await repository.deleteUserInformation(params);
  }
}
