import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcard/features/auth/domain/use%20cases/logout.dart';
import 'package:kcard/features/auth/domain/use%20cases/register.dart';

import '../../../domain/entities/auth.dart';
import '../../../domain/use cases/login.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  LogoutUseCase logoutUseCase;

  AuthController(
      {required this.loginUseCase,
      required this.registerUseCase,
      required this.logoutUseCase});

  void login() async {
    try {
      isLoading.value = true;
      final results = await loginUseCase(
          Auth(email: emailController.text, password: passwordController.text));
      isLoading.value = false;
      results.fold((left) {
        Get.snackbar('Error', 'Error');
        print(left.runtimeType);
      }, (right) {
        // Get.offAllNamed('/home');
        print("ok");
      });
    } catch (error) {
      Get.snackbar('Error', 'Error');
      print(error.runtimeType);
    }
  }

  void register() async {
    try {
      isLoading.value = true;
      final results = await registerUseCase(
          Auth(email: emailController.text, password: passwordController.text));
      isLoading.value = false;
      results.fold((left) {
        Get.snackbar('Error', 'Error');
        print(left.runtimeType);
      }, (right) {
        // Get.offAllNamed(RegisterScreen.routeName);
        print("email send");
      });
    } catch (error) {
      Get.snackbar('Error', 'Error');
      print(error.runtimeType);
    }
  }

  void logout() async {
    try {
      isLoading.value = true;
      final results = await logoutUseCase();
      isLoading.value = false;
      results.fold((left) {
        Get.snackbar('Error', 'Error');
        print(left.runtimeType);
      }, (right) {
        Get.offAllNamed('/welcomeScreen');
      });
    } catch (error) {
      Get.snackbar('Error', 'Error');
      print(error.runtimeType);
    }
  }
}
