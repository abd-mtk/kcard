import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcard/app/utils/constants/reloaad_box.dart';

import '../getx/controllers/dashboard_controller.dart';
import '../widgets/chart_container.dart';
import '../widgets/pie_chart_widget.dart';

class WalletChartsScreen extends StatelessWidget {
  WalletChartsScreen({Key? key}) : super(key: key);
  static const String routeName = '/walletChartsScreen';
  final DashboardController dashboardcontroller =
      Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<DashboardController>(builder: (_) {
        return dashboardcontroller.budget != null
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Get.height * 0.35,
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
                        child: PieChartWidget(
                            dashboardcontroller: dashboardcontroller),
                      ),
                    ),
                  ),
                  ChartContainer(
                    spots: dashboardcontroller.paymentspots,
                    title: 'Payment',
                  ),
                  ChartContainer(
                    spots: dashboardcontroller.incomespots,
                    title: 'Incomes',
                  ),
                  ChartContainer(
                    spots: dashboardcontroller.debtspots,
                    title: 'Debts',
                  ),
                ],
              )
            : ReloadBox(onPressed: dashboardcontroller.getDashboard);
      }),
    );
  }
}
