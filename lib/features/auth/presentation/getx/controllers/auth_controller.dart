import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../user/presentation/screens/profile_screen.dart';
import '../../../domain/entities/auth.dart';
import '../../../domain/use cases/login.dart';
import '../../../domain/use cases/logout.dart';
import '../../../domain/use cases/register.dart';
import '../../screens/login_screen.dart';
import '../../screens/welcome_screen.dart';

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
        if (kDebugMode) {
          print(left.runtimeType);
        }
      }, (right) {
        Get.offAllNamed(ProfileScreen.routeName);
        if (kDebugMode) {
          print("ok");
        }
      });
    } catch (error) {
      Get.snackbar('Error', 'Error');
      if (kDebugMode) {
        print(error.runtimeType);
      }
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
        if (kDebugMode) {
          print(left.runtimeType);
        }
      }, (right) {
        Get.offAllNamed(LoginScreen.routeName);
        if (kDebugMode) {
          print("email send");
        }
      });
    } catch (error) {
      Get.snackbar('Error', 'Error');
      if (kDebugMode) {
        print(error.runtimeType);
      }
    }
  }

  void logout() async {
    try {
      isLoading.value = true;
      final results = await logoutUseCase();
      isLoading.value = false;
      results.fold((left) {
        Get.snackbar('Error', 'Error');
        if (kDebugMode) {
          print(left.runtimeType);
        }
      }, (right) {
        Get.offAllNamed(WelcomeScreen.routeName);
      });
    } catch (error) {
      Get.snackbar('Error', 'Error');
      if (kDebugMode) {
        print(error.runtimeType);
      }
    }
  }
}
