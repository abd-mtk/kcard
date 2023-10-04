
import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/user/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class UpadetUserInformationUseCase {
  final UserRepository repository;

  UpadetUserInformationUseCase(this.repository);

  Future<Either<UserFailure, User>> call(User params) async {
    return await repository.updateUserInformation(params);
  }
}
