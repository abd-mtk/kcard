import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../getx/controllers/transaction_chart_controller.dart';
import '../widgets/chart_container.dart';

class TransactionChartsScreen extends StatelessWidget {
  TransactionChartsScreen({Key? key}) : super(key: key);
  static const String routeName = '/transactionChartsScreen';
  final TransactionChartsController controller =
      Get.find<TransactionChartsController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<TransactionChartsController>(builder: (_) {
        return controller.receiveSpots.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BarchartContainer(controller: controller),
                  ChartContainer(
                    spots: controller.receiveSpots,
                    title: 'Receive',
                  ),
                  ChartContainer(
                    spots: controller.sendSpots,
                    title: 'Send',
                  ),
                ],
              )
            : SizedBox(
                height: Get.height * 0.4,
                child: Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: Colors.purple,
                    size: 40,
                  ),
                ),
              );
      }),
    );
  }
}

class BarchartContainer extends StatelessWidget {
  const BarchartContainer({
    super.key,
    required this.controller,
  });

  final TransactionChartsController controller;

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

  final TransactionChartsController controller;

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
                y: controller.maxvsentalue,
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
                      toY: controller.maxvsentalue,
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
