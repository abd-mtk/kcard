import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/dashboard_controller.dart';
import 'bar_chart_widget.dart';
import 'bars_name.dart';

class BarchartContainer extends StatelessWidget {
  const BarchartContainer({
    super.key,
    required this.controller,
  });

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.height * 0.45,
        decoration: BoxDecoration(
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
            BarChartWidget(controller: controller),
            const BarsName(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Transactions Count',
                  style: TextStyle(
                    fontSize: 16,
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
