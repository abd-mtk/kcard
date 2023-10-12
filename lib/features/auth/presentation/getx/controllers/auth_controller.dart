import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../home/screens/home_screen.dart';
import '../../../domain/entities/auth.dart';
import '../../../domain/use cases/login.dart';
import '../../../domain/use cases/logout.dart';
import '../../../domain/use cases/register.dart';
import '../../screens/welcome_screen.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  LogoutUseCase logoutUseCase;

  AuthController(
      {required this.loginUseCase,
      required this.registerUseCase,
      required this.logoutUseCase});

  void login() async {
    try {
      final results = await loginUseCase(
          Auth(email: emailController.text, password: passwordController.text));
      results.fold((left) {
        // Get.snackbar('Error', 'Error');
        // if (kDebugMode) {
        //   print(left.runtimeType);
        // }
      }, (right) {
        Get.offAllNamed(HomeScreen.routeName);
        // if (kDebugMode) {
        //   print("ok");
        // }
      });
    } catch (error) {
      // Get.snackbar('Error', 'Error');
      // if (kDebugMode) {
      //   print(error.runtimeType);
      // }
    }
  }

  void register() async {
    try {
      final results = await registerUseCase(
          Auth(email: emailController.text, password: passwordController.text));
      results.fold((left) {
        // Get.snackbar('Error', 'Error');
        // if (kDebugMode) {
        //   print(left.runtimeType);
        // }
      }, (right) {
        // Get.offAllNamed(LoginScreen.routeName);
        // if (kDebugMode) {
        //   print("email send");
        // }
      });
    } catch (error) {
      // Get.snackbar('Error', 'Error');
      // if (kDebugMode) {
      //   print(error.runtimeType);
      // }
    }
  }

  void logout() async {
    try {
      final results = await logoutUseCase();
      results.fold((left) {
        // Get.snackbar('Error', 'Error');
        // if (kDebugMode) {
        //   print(left.runtimeType);
        // }
      }, (right) {
        Get.offAllNamed(WelcomeScreen.routeName);
      });
    } catch (error) {
      // Get.snackbar('Error', 'Error');
      // if (kDebugMode) {
      //   print(error.runtimeType);
      // }
    }
  }
}
