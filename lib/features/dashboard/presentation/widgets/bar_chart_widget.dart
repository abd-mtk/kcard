import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/dashboard_controller.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({
    super.key,
    required this.controller,
  });

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.34,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BarChart(
          BarChartData(
            extraLinesData: ExtraLinesData(horizontalLines: [
              HorizontalLine(
                y: controller.maxvsentvalue,
                color: Colors.green.withOpacity(0.5),
                strokeWidth: 2,
              ),
              HorizontalLine(
                y: controller.maxreceivedvalue,
                color: Colors.red.withOpacity(0.5),
                strokeWidth: 2,
              ),
            ]),
            backgroundColor: Colors.black,
            barTouchData: BarTouchData(
                enabled: true,
                allowTouchBarBackDraw: true,
                touchTooltipData:
                    BarTouchTooltipData(fitInsideVertically: true)),
            barGroups: [
              BarChartGroupData(
                  x: controller.sendSpots.length,
                  barsSpace: 50,
                  barRods: [
                    BarChartRodData(
                      width: 20,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      toY: controller.maxvsentvalue,
                      color: Colors.green,
                    ),
                    BarChartRodData(
                      width: 20,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      toY: controller.maxreceivedvalue,
                      color: Colors.red,
                    ),
                  ]),
              BarChartGroupData(x: controller.receiveSpots.length, barsSpace: 5)
            ],
          ),
        ),
      ),
    );
  }
}