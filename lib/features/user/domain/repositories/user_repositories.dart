import 'package:fpdart/fpdart.dart';


import '../../../../app/errors/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUserInformation();
  Future<Either<Failure, User>> addUserInformation(User params);
  Future<Either<Failure, User>> updateUserInformation(User params);
  Future<Either<Failure, Unit>> deleteUserInformation(User params);

}
