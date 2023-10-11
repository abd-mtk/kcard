import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/dashboard_controller.dart';
import '../widgets/chart_container.dart';

class TransactionChartsScreen extends StatelessWidget {
  TransactionChartsScreen({Key? key}) : super(key: key);
  static const String routeName = '/transactionChartsScreen';

  final DashboardController dashboardcontroller =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<DashboardController>(builder: (_) {
        return dashboardcontroller.transaction != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BarchartContainer(controller: dashboardcontroller),
                  ChartContainer(
                    spots: dashboardcontroller.receiveSpots,
                    title: 'Receive',
                  ),
                  ChartContainer(
                    spots: dashboardcontroller.sendSpots,
                    title: 'Send',
                  ),
                ],
              )
            : ReloadBox(onPressed: dashboardcontroller.getDashboard);
      }),
    );
  }
}

class ReloadBox extends StatelessWidget {
  const ReloadBox({
    super.key,
    required this.onPressed,
  });

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'No data',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () => onPressed(),
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'))
        ],
      ),
    );
  }
}

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
            BarChartWidget(controller: controller),
            const BarsName(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Transactions Count',
                  style: TextStyle(
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

class BarsName extends StatelessWidget {
  const BarsName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            SizedBox(
              width: 10,
              height: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Text(
              'Sent',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: 10,
              height: 10,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Text(
              'Received',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
