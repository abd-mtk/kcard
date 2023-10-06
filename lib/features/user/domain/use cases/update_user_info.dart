
import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class UpdatetUserInformationUseCase {
  final UserRepository repository;

  UpdatetUserInformationUseCase(this.repository);

  Future<Either<Failure, User>> call(User params) async {
    return await repository.updateUserInformation(params);
  }
}
