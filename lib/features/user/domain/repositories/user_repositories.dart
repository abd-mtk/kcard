import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<AuthFailure, User>> addUserInformation(User params);
  Future<Either<AuthFailure, User>> updateUserInformation(User params);
  Future<Either<AuthFailure, Unit>> deleteUserInformation(User params);
}
