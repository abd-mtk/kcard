import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../getx/controllers/auth_controller.dart';
import '../widgets/input_field.dart';
import '../widgets/logo.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const String routeName = '/registerScreen';
  AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(
              image: "assets/images/register.png",
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
                    controller.register();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'انشاء حساب',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
