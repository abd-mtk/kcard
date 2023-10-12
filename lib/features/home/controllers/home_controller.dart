import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/features.dart';

class HomeController extends GetxController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  void changeIndex(int index) => _selectedIndex.value = index;

  final _isDark = false.obs;
  bool get isDark => _isDark.value;

  void changeTheme() => _isDark.value = !_isDark.value;

  Widget get selectedScreen => screens[_selectedIndex.value];

  @override
  void onInit() {
    super.onInit();
  }
}
