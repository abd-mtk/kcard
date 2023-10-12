import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kcard/app/utils/constants/reloaad_box.dart';

import '../../../auth/presentation/getx/controllers/auth_controller.dart';
import '../getx/controllers/profile_controller.dart';
import '../widgets/profile_buttons.dart';
import '../widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  final ProfileController profileController = Get.find<ProfileController>();
  final AuthController authController = Get.find<AuthController>();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Profile', style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              onPressed: () {
                profileController.getUserInformation();
              },
              icon: const Icon(Icons.refresh, color: Colors.white),
            )
          ],
          leading: IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: 'Logout',
                  middleText: 'Are you sure you want to logout?',
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          authController.logout();
                        },
                        child: const Text('Logout')),
                  ]);
            },
            icon: const Icon(Iconsax.logout, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ProfileController>(builder: (_) {
              return profileController.user != null
                  ? ProfileCrad(
                      jobtype: profileController.user!.workingmode,
                      salary: profileController.user!.salary,
                      curranecy:
                          "${profileController.user!.curranecy} / ${profileController.user!.receipt}",
                      username: profileController.user!.name,
                      jobtitle: profileController.user!.jobtitle,
                      // experience: '2 years',
                    )
                  : ReloadBox(onPressed: profileController.getUserInformation);
            }),
            const Divider(thickness: 2),
            const Gap(100),
            const ProfileButtons(),
          ],
        ),
      ),
    );
  }
}
