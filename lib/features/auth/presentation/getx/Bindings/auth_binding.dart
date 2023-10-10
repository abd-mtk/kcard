import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../data/data sources/local/auth_local_data_source.dart';
import '../../../data/data sources/remote/auth_remot_data_source.dart';
import '../../../data/repositories/auth_repository_implement.dart';
import '../../../domain/use cases/login.dart';
import '../../../domain/use cases/logout.dart';
import '../../../domain/use cases/register.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  AppServices appservices = Get.find<AppServices>();
  // AuthServices authservices = Get.find<AuthServices>();

  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() {
      final repository = AuthRepositoryImplement(
        localDataSource: AuthLocalDataSourceImplement(
            sharedPreferences: appservices.sharedPreferences),
        networkInfo: appservices.networkInfo,
        remoteDataSource: const AuthRemoteDataSourceImplement(),
      );
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
