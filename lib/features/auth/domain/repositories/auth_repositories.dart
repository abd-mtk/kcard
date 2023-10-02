import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/login.dart';
import '../entities/login_data.dart';
import '../entities/passwor_reset.dart';
import '../entities/register.dart';
import '../entities/register_data.dart';

abstract class AuthRepositories {
  Future<Either<AuthFailure, LoginData>> logInWithEmailAndPassword(
      Login loginInformation);
  Future<Either<AuthFailure, RegisterData>> registerWithEmailAndPassword(
      Register registerInformation);
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(String email);
  Future<Either<AuthFailure, Unit>> verifyPasswordResetCode(String code);
  Future<Either<AuthFailure, Unit>> passwordReset(PasswordReset passwordReset);
  Future<Either<AuthFailure, Unit>> passwordCheck(String password);
  Future<Either<AuthFailure, Unit>> logOut();
}
