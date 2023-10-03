import 'package:fpdart/fpdart.dart';
import '../../../../app/errors/auth/failures.dart';
import '../repositories/auth_repositories.dart';


class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<Either<AuthFailure, Unit>> call() async {
    return await _authRepository.logout();
  }
}