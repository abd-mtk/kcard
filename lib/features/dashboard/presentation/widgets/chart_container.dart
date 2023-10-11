import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_chart.dart';

class ChartContainer extends StatelessWidget {
  const ChartContainer({
    super.key,
    required this.spots,
    required this.title,
  });

  final List<FlSpot> spots;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.3),
              blurRadius: 10,
              blurStyle: BlurStyle.solid,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            CustomChart(spots: spots),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
