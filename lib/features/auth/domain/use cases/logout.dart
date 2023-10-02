import 'package:fpdart/fpdart.dart';
import '../repositories/auth_repositories.dart';


class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<Unit> call() async {
    return await _authRepository.logout();
  }
}