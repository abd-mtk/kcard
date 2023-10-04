import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/user/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class DeleteUserInformationUseCase {
  final UserRepository repository;

  DeleteUserInformationUseCase(this.repository);

  Future<Either<UserFailure, Unit>> call(User params) async {
    return await repository.deleteUserInformation(params);
  }
}
