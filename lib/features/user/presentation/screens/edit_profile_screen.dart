import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kcard/features/user/presentation/getx/controllers/profile_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../getx/controllers/edit_profile_controller.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/edit_profile_filed.dart';
import '../widgets/edit_profile_types.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  static const String routeName = '/edit-profile';
  final EditProfileController editProfileController =
      Get.find<EditProfileController>();
  final ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text('Edit Profile', style: TextStyle(color: Colors.white)),
          actions: [
            GetBuilder<EditProfileController>(builder: (_) {
              return IconButton(
                onPressed: () {
                  editProfileController.addUserInformation();

                  profileController.getUserInformation();
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              );
            })
          ],
        ),
        body: GetBuilder<EditProfileController>(builder: (_) {
          return editProfileController.isloding
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset("assets/images/edit.png",
                            height: 170, width: 170),
                      ),
                      const Divider(
                          thickness: 2,
                          color: Colors.black26,
                          endIndent: 10,
                          indent: 10),
                      EditProfileFiled(
                        label: 'Name',
                        icon: Icons.person,
                        controller: editProfileController.nameController,
                      ),
                      EditProfileFiled(
                        label: 'Nickname',
                        icon: Iconsax.document_favorite,
                        controller: editProfileController.nicknameController,
                      ),
                      EditProfileFiled(
                        label: 'Job Title',
                        icon: EvaIcons.credit_card,
                        controller: editProfileController.jobtitleController,
                      ),
                      CustomDropDown(
                        label: "Working Type",
                        controller: editProfileController.workingmodeController,
                        items: workingtype,
                        defaultItem: workingtypelist.indexOf(
                            editProfileController.workingmodeController.text),
                      ),
                      EditProfileFiled(
                        label: 'Salary',
                        icon: Icons.money,
                        keyboardType: TextInputType.number,
                        controller: editProfileController.salaryController,
                      ),
                      CustomDropDown(
                        label: "Currency",
                        controller: editProfileController.currencyController,
                        items: curranecy,
                        defaultItem: curranecylist.indexOf(
                            editProfileController.currencyController.text),
                      ),
                      CustomDropDown(
                        label: "Receipt Type",
                        controller: editProfileController.receipttypeController,
                        items: receipttype,
                        defaultItem: receipttypelist.indexOf(
                            editProfileController.receipttypeController.text),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: 200,
                  child: Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: Colors.purple,
                      size: 40,
                    ),
                  ),
                );
        }));
  }
}
