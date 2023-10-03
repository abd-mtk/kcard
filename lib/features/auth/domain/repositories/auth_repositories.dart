import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/auth.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Auth>> login(Auth params);
  Future<Either<AuthFailure, Auth>> register(Auth params);
  Future<Either<AuthFailure, Unit>> logout();
}
