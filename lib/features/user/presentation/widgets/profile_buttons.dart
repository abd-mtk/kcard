import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../screens/edit_profile_screen.dart';
import '../screens/setting_screen.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ZoomTapAnimation(
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Icon(Iconsax.card_edit, size: 50),
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Get.toNamed(EditProfileScreen.routeName),
        ),
        ZoomTapAnimation(
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Icon(IonIcons.settings, size: 50),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Get.toNamed(SettingScreen.routeName),
        ),
      ],
    );
  }
}
