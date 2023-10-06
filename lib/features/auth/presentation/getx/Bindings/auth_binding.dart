import 'package:get/get.dart';

import '../../../../../app/utils/resources/app_services.dart';
import '../../../../../app/utils/resources/auth_services.dart';
import '../../../data/repositories/auth_repository_implement.dart';
import '../../../domain/use cases/login.dart';
import '../../../domain/use cases/logout.dart';
import '../../../domain/use cases/register.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  AppServices appservices = Get.find<AppServices>();
  AuthServices authservices = Get.find<AuthServices>();

  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() {
      final repository = AuthRepositoryImplement(
          localDataSource: authservices.localDataSource,
          networkInfo: appservices.networkInfo,
          remoteDataSource: authservices.remoteDataSource);
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
