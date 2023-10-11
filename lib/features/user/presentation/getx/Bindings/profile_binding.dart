import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/resources/services/app_services.dart';
import '../../../data/data sources/local/user_local_data_source.dart';
import '../../../data/data sources/remote/user_remot_data_source.dart';
import '../../../data/repositories/user_repository_implement.dart';
import '../../../domain/use cases/get_user_info.dart';
import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  AppServices appservices = Get.find<AppServices>();
  // UserServices userservices = Get.find<UserServices>();

  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() {
      final UserRepositoryImplement repository = UserRepositoryImplement(
          localDataSource: UserLocalDataSourceImplement(
              sharedPreferences: appservices.sharedPreferences),
          networkInfo: appservices.networkInfo,
          remoteDataSource: UserRemoteDataSourceImplement(
              uid: FirebaseAuth.instance.currentUser!.uid));

      return ProfileController(
          getUserInformationUseCase: GetUserInformationUseCase(repository));
    });
  }
}
