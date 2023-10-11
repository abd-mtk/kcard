import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/dashboard_controller.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.dashboardcontroller,
  });

  final DashboardController dashboardcontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.25,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: Colors.green,
                  value: dashboardcontroller.incomevalues.length.toDouble(),
                  title: 'Income ${dashboardcontroller.budget!.income}',
                  radius: 100,
                  titlePositionPercentageOffset: 0.7,
                ),
                PieChartSectionData(
                  color: Colors.red,
                  value: dashboardcontroller.paymentvalues.length.toDouble(),
                  title: 'Payment ${dashboardcontroller.budget!.payment}',
                  radius: 100,
                  titlePositionPercentageOffset: 0.7,
                ),
                PieChartSectionData(
                  color: Colors.blue,
                  value: dashboardcontroller.debtvalues.length.toDouble(),
                  title: 'Debt ${dashboardcontroller.budget!.debt}',
                  radius: 100,
                  titlePositionPercentageOffset: 0.7,
                ),
              ],
              centerSpaceRadius: 0,
              sectionsSpace: 0,
              startDegreeOffset: 180,
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Wallet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
