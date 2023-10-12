import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/config/themes/dark_theme.dart';
import '../../../../../app/config/themes/light_theme.dart';

class SettingController extends GetxController {
  final darkMode = false.obs;
  final notification = false.obs;
  final language = 'English'.obs;
  final currency = 'USD'.obs;

  final ThemeData light = lightTheme;
  final ThemeData dark = darkTheme;
  ThemeData _currentTheme = lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void changeTheme(ThemeData theme) {
    _currentTheme = theme;
    update();
  }

  void changeNotification(bool value) {
    notification.value = value;
  }

  void changeLanguage(String value) {
    language.value = value;
  }

  void changeCurrency(String value) {
    currency.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
