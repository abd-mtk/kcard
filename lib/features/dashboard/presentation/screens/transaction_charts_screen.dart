import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/utils/constants/reloaad_box.dart';
import '../getx/controllers/dashboard_controller.dart';
import '../widgets/bar_chart_container.dart';
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
