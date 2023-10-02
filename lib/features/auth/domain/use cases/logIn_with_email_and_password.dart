import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/login.dart';
import '../entities/login_data.dart';
import '../repositories/auth_repositories.dart';

class LogInWithEmailAndPasswordUseCase {
  final AuthRepositories repository;

  LogInWithEmailAndPasswordUseCase({required this.repository});

  Future<Either<AuthFailure, LoginData>> call(Login loginInformation) async {
    return await repository.logInWithEmailAndPassword(loginInformation);
  }
}
