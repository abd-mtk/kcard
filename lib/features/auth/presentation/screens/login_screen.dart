import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../getx/controllers/auth_controller.dart';
import '../widgets/input_field.dart';
import '../widgets/logo.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const routeName = '/loginScreen';

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(
              image: "assets/images/login.png",
            ),
            const Gap(50),
            GetBuilder<AuthController>(builder: (_) {
              return CustomInputField(
                controller: controller.emailController,
                suffixIcon: Icons.email,
                isPassword: false,
              );
            }),
            GetBuilder<AuthController>(builder: (_) {
              return CustomInputField(
                controller: controller.passwordController,
                suffixIcon: Icons.lock,
                isPassword: true,
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('تسجيل الدخول'),
                ),
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.toNamed(RegisterScreen.routeName);
                  },
                  child: const Text(
                    'انشاء حساب ',
                  ),
                ),
                const Text(
                  'ليس لديك حساب؟',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
