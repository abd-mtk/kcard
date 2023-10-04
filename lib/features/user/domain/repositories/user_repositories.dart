import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/user/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<UserFailure, User>> getUserInformation();
  Future<Either<UserFailure, User>> addUserInformation(User params);
  Future<Either<UserFailure, User>> updateUserInformation(User params);
  Future<Either<UserFailure, Unit>> deleteUserInformation(User params);

}
