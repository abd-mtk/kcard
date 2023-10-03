import 'package:get/get.dart';

import '../../../../../app/utils/resources/services.dart';
import '../../../data/repositories/auth_repository_implement.dart';
import '../../../domain/use cases/login.dart';
import '../../../domain/use cases/logout.dart';
import '../../../domain/use cases/register.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  Services services = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() {
      final repository = AuthRepositoryImplement(
          localDataSource: services.localDataSource,
          networkInfo: services.networkInfo,
          remoteDataSource: services.remoteDataSource);
      final loginUseCase = LoginUseCase(repository);
      final registerUseCase = RegisterUseCase(repository);
      final logoutUseCase = LogoutUseCase(repository);

      return AuthController(
          loginUseCase: loginUseCase,
          registerUseCase: registerUseCase,
          logoutUseCase: logoutUseCase);
    });
  }
}
