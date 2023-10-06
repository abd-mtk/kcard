import 'package:get/get.dart';
import 'package:kcard/features/user/domain/use%20cases/get_user_info.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../../../app/utils/resources/services/user_services.dart';
import '../../../data/repositories/user_repository_implement.dart';
import '../../../domain/use cases/add_user_info.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  AppServices appservices = Get.find<AppServices>();
  UserServices userservices = Get.find<UserServices>();
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() {
      final UserRepositoryImplement repository = UserRepositoryImplement(
          localDataSource: userservices.userLocalDataSource,
          networkInfo: appservices.networkInfo,
          remoteDataSource: userservices.userRemoteDataSource);

      return EditProfileController(
          addUserInformationUseCase: AddUserInformationUseCase(repository),
          getUserInformationUseCase: GetUserInformationUseCase(repository));
    });
  }
}
