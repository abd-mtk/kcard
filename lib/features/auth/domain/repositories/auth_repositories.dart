import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/auth.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, User>> login(Auth params);
  Future<Either<AuthFailure, User>> register(Auth params);
  Future<Unit> logout();
}