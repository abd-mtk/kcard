import 'package:fpdart/fpdart.dart';

import '../../../../app/errors/auth/failures.dart';
import '../entities/register.dart';
import '../entities/register_data.dart';
import '../repositories/auth_repositories.dart';

class RegisterWithEmailAndPasswordUseCase {
  final AuthRepositories repository;

  RegisterWithEmailAndPasswordUseCase({required this.repository});

  Future<Either<AuthFailure, RegisterData>> call(
      Register registerInformation) async {
    return await repository.registerWithEmailAndPassword(registerInformation);
  }
}
