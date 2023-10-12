import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../getx/controllers/auth_controller.dart';
import '../widgets/auth_input.dart';
import '../widgets/logo.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const routeName = '/loginScreen';

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(20),
            Logo(
              image: "assets/images/login.png",
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
                    controller.login();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(RegisterScreen.routeName);
                  },
                  child: const Text(
                    'Register Now',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
