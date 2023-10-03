import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/auth.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Auth>> login(Auth params);
  Future<Either<AuthFailure, Auth>> register(Auth params);
  Future<Either<AuthFailure, Unit>> logout();

  Future<Either<AuthFailure, User>> addUserInformation(User params);
  Future<Either<AuthFailure, User>> updateUserInformation(User params);
  Future<Either<AuthFailure, Unit>> deleteUserInformation(User params);
}
