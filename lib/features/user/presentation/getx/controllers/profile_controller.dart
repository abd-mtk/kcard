import 'package:get/get.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/use cases/get_user_info.dart';

class ProfileController extends GetxController {
  GetUserInformationUseCase getUserInformationUseCase;
  User? user;

  ProfileController({required this.getUserInformationUseCase});

  Future<void> getUserInformation() async {
    final result = await getUserInformationUseCase();
    result.fold(
      (failure) => {
        Get.snackbar(
          'Error',
          failure.toString(),
          snackPosition: SnackPosition.TOP,
        )
      },
      (user) {
        this.user = user;
        update();
      },
    );
  }

  @override
  void onInit() {
    getUserInformation();
    super.onInit();
  }
}
