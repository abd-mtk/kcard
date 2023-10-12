import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../getx/controllers/auth_controller.dart';
import '../widgets/auth_input.dart';
import '../widgets/logo.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const String routeName = '/registerScreen';
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(
              image: "assets/images/register.png",
            ),
            const Gap(50),
            GetBuilder<AuthController>(builder: (_) {
              return AuthInput(
                controller: controller.emailController,
                isPassword: false,
                label: 'Email',
                icon: Icons.email,
              );
            }),
            GetBuilder<AuthController>(builder: (_) {
              return AuthInput(
                controller: controller.passwordController,
                isPassword: true,
                label: 'Password',
                icon: Icons.lock,
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
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 16,
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
