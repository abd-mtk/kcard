import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class AddUserInformationUseCase {
  final UserRepository repository;

  AddUserInformationUseCase(this.repository);

  Future<Either<Failure, User>> call(User params) async {
    return await repository.addUserInformation(params);
  }
}
