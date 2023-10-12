import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../getx/controllers/setting_controller.dart';
import '../widgets/setting_option.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  static const String routeName = '/setting';
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/settings.png",
                          height: 170, width: 170)
                    ],
                  ),
                ],
              ),
              const Gap(20),
              SettingOption(
                option: 'Theme',
                icon: Iconsax.sun,
                onTap: () {
                  settingController.changeTheme(
                      settingController.currentTheme == settingController.light
                          ? settingController.dark
                          : settingController.light);
                },
              ),
              const Divider(
                  thickness: 2,
                  color: Colors.black26,
                  endIndent: 10,
                  indent: 10),
              SettingOption(
                option: 'Language',
                icon: Iconsax.language_circle,
                onTap: () {},
              ),
              const Divider(
                  thickness: 2,
                  color: Colors.black26,
                  endIndent: 10,
                  indent: 10),
              SettingOption(
                option: 'Notification',
                icon: Iconsax.notification,
                onTap: () {},
              ),
              const Divider(
                  thickness: 2,
                  color: Colors.black26,
                  endIndent: 10,
                  indent: 10),
              SettingOption(
                option: 'Currency',
                icon: Iconsax.calculator,
                onTap: () {},
              ),
              const Divider(
                  thickness: 2,
                  color: Colors.black26,
                  endIndent: 10,
                  indent: 10),
              const Gap(90),
              const Text(
                'Version 1.0.0',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
