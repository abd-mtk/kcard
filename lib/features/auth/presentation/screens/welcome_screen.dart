import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../app/utils/constants/introduction_list.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome", style: TextStyle(color: Colors.white)),
      ),
      body: IntroductionScreen(
        bodyPadding: const EdgeInsets.all(10),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        curve: Curves.easeInCubic,
        globalBackgroundColor: Colors.white70,
        pages: introductionList,
        showSkipButton: true,
        showNextButton: false,
        skip: const Text(
          "Skip",
        ),
        done: const Text("Done"),
        onDone: () {
          Get.offNamed(LoginScreen.routeName);
        },
      ),
    );
  }
}
