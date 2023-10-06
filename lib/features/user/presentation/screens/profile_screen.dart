import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../getx/controllers/profile_controller.dart';
import '../widgets/profile_buttons.dart';
import '../widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  final ProfileController profileController = Get.find<ProfileController>();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                : const CircularProgressIndicator();
          }),
          const Divider(thickness: 2),
          const Gap(100),
          const ProfileButtons(),
        ],
      ),
    );
  }
}
