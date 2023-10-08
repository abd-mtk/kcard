import 'package:flutter/material.dart';
import 'package:get/get.dart';

double responsivSize(double portrait, double landscape) {
  return Get.mediaQuery.orientation == Orientation.portrait
      ? Get.height * portrait
      : Get.height * landscape;
}
