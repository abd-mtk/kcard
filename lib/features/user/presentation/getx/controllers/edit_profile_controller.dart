import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/use cases/add_user_info.dart';
import '../../../domain/use cases/delete_user_info.dart';
import '../../../domain/use cases/get_user_info.dart';
import '../../../domain/use cases/update_user_info.dart';

class EditProfileController extends GetxController {
  AddUserInformationUseCase addUserInformationUseCase;
  GetUserInformationUseCase getUserInformationUseCase;

  bool isloding = false;

  EditProfileController(
      {required this.addUserInformationUseCase,
      required this.getUserInformationUseCase});

  TextEditingController nameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController jobtitleController = TextEditingController();
  TextEditingController workingmodeController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController receipttypeController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  @override
  void onInit() {
    getUserInformation();
    super.onInit();
  }

  Future<void> getUserInformation() async {
    final result = await getUserInformationUseCase.call();
    result.fold(
      (failure) => {
        Get.snackbar(
          'Error',
          failure.toString(),
          snackPosition: SnackPosition.TOP,
        ),
        // Navigator.pop(Get.context!)
      },
      (user) {
        nameController.text = user.name;
        nicknameController.text = user.nickname ?? '';
        jobtitleController.text = user.jobtitle ?? '';
        workingmodeController.text = user.workingmode;
        salaryController.text = user.salary.toString();
        receipttypeController.text = user.receipt;
        currencyController.text = user.curranecy;
        isloding = true;
        update();
      },
    );
  }

  Future<void> addUserInformation() async {
    final result = await addUserInformationUseCase.call(
      User(
        name: nameController.text,
        nickname: nicknameController.text,
        jobtitle: jobtitleController.text,
        workingmode: workingmodeController.text,
        receipt: receipttypeController.text,
        salary: double.parse(salaryController.text),
        curranecy: currencyController.text,
      ),
    );
    result.fold(
      (failure) => {
        Get.snackbar(
          'Error',
          failure.toString(),
          snackPosition: SnackPosition.TOP,
        ),
        Navigator.pop(Get.context!)
      },
      (user) {
        Get.snackbar(
          'Success',
          'User information added successfully',
          snackPosition: SnackPosition.TOP,
        );
        Navigator.pop(Get.context!);
      },
    );
  }
}
