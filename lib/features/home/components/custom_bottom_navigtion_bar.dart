import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kcard/features/home/controllers/home_controller.dart';

import 'google_nav_bar.dart';

class CustomBottomNavigtionbBar extends StatelessWidget {
  final HomeController homeController;
  const CustomBottomNavigtionbBar({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: Get.height * 0.065,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: GNav(
            onTabChange: (value) {
              homeController.changeIndex(value);
            },
            haptic: true,
            tabBorderRadius: 10,
            curve: Curves.easeInToLinear,
            duration: const Duration(milliseconds: 200),
            gap: 5,
            color: Colors.grey[800],
            activeColor: Colors.green,
            iconSize: 25,
            tabBackgroundColor: Colors.white.withOpacity(0.2),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            tabs: gButton),
      ),
    );
  }
}
