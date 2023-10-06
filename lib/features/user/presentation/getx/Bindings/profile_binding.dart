import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../../../app/utils/resources/services/user_services.dart';
import '../../../data/repositories/user_repository_implement.dart';
import '../../../domain/use cases/get_user_info.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  AppServices appservices = Get.find<AppServices>();
  UserServices userservices = Get.find<UserServices>();
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() {
      final UserRepositoryImplement repository = UserRepositoryImplement(
          localDataSource: userservices.userLocalDataSource,
          networkInfo: appservices.networkInfo,
          remoteDataSource: userservices.userRemoteDataSource);

      return ProfileController(
          getUserInformationUseCase: GetUserInformationUseCase(repository));
    });
  }
}
