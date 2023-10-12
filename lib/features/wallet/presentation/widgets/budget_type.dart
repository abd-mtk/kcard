import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../app/utils/resources/tools/responsive_size.dart';
import 'container_decoration.dart';

class BudgetType extends StatelessWidget {
  final String title;
  final String value;
  final String image;
  final Function onTap;
  final Color? color;

  const BudgetType(
      {Key? key,
      required this.title,
      required this.value,
      required this.image,
      required this.onTap,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ZoomTapAnimation(
        onTap: () => onTap(),
        child: Container(
          width: Get.width * 0.99,
          height: responsivSize(0.18, 0.35),
          decoration: containerDecoration(color ?? Colors.white),
          child: Stack(
            children: [
              Positioned(
                top: 5,
                left: 10,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Positioned(
                top: 60,
                left: 10,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 20, right: 20),
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Positioned(
                top:
                    Get.mediaQuery.orientation == Orientation.portrait ? 0 : 25,
                right: Get.mediaQuery.orientation == Orientation.portrait
                    ? 5
                    : -40,
                child: Image.asset(
                  image,
                  width: Get.width * 0.25,
                  height: Get.height * 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
