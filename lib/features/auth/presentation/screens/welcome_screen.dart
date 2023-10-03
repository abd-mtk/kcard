import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kcard/features/auth/presentation/screens/login_screen.dart';

import '../../../../app/utils/constants/introduction_list.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        bodyPadding: const EdgeInsets.all(10),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Theme.of(context).colorScheme.primary,
          color: Theme.of(context).colorScheme.secondary,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        curve: Curves.easeInCubic,
        globalBackgroundColor: Colors.white,
        pages: introductionList,
        showSkipButton: true,
        showNextButton: false,
        skip: const Text("تخطي", style: TextStyle(color: Colors.black)),
        done: const Text("اكمال", style: TextStyle(color: Colors.black)),
        onDone: () {
          Get.offNamed(LoginScreen.routeName);
        },
      ),
    );
  }
}
