import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/user/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class AddUserInformationUseCase {
  final UserRepository repository;

  AddUserInformationUseCase(this.repository);

  Future<Either<UserFailure, User>> call(User params) async {
    return await repository.addUserInformation(params);
  }
}
