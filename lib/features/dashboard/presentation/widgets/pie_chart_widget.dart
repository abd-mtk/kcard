import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/wallet_charts_controller.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({
    super.key,
    required this.controller,
  });

  final WalletChartsController controller;

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
                  value: controller.incomevalues.length.toDouble(),
                  title: 'Income ${controller.budget!.income}',
                  radius: 100,
                  titlePositionPercentageOffset: 0.7,
                ),
                PieChartSectionData(
                  color: Colors.red,
                  value: controller.expensevalues.length.toDouble(),
                  title: 'Expense ${controller.budget!.expenses}',
                  radius: 100,
                  titlePositionPercentageOffset: 0.7,
                ),
                PieChartSectionData(
                  color: Colors.blue,
                  value: controller.debtvalues.length.toDouble(),
                  title: 'Debt ${controller.budget!.debt}',
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
