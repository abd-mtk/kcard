import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_bottom_navigtion_bar.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  HomeController homeController = Get.find<HomeController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return homeController.selectedScreen;
      }),
      bottomNavigationBar:
          CustomBottomNavigtionbBar(homeController: homeController),
    );
  }
}
