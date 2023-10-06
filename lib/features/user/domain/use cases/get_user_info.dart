
import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/user_repositories.dart';

class GetUserInformationUseCase {
  final UserRepository repository;

  GetUserInformationUseCase(this.repository);

  Future<Either<Failure, User>> call() async {
    return await repository.getUserInformation();
  }
}
