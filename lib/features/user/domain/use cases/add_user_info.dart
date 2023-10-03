import 'package:fpdart/fpdart.dart';
import 'package:kcard/app/errors/auth/failures.dart';

import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class AddUserInformationUseCase {
  final UserRepository repository;

  AddUserInformationUseCase(this.repository);

  Future<Either<AuthFailure, User>> call(User params) async {
    return await repository.addUserInformation(params);
  }
}
