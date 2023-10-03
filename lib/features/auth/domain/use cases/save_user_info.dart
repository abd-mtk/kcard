import 'package:fpdart/fpdart.dart';
import 'package:kcard/app/errors/auth/failures.dart';

import '../entities/user.dart';
import '../repositories/auth_repositories.dart';

class SaveUserInformationUseCase {
  final AuthRepository repository;

  SaveUserInformationUseCase(this.repository);

  Future<Either<AuthFailure, User>> call(User params) async {
    return await repository.addUserInformation(params);
  }
}
