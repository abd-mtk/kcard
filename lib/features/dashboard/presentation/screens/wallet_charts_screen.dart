import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../getx/controllers/wallet_charts_controller.dart';
import '../widgets/chart_container.dart';
import '../widgets/pie_chart_widget.dart';

class WalletChartsScreen extends StatelessWidget {
  WalletChartsScreen({Key? key}) : super(key: key);
  static const String routeName = '/walletChartsScreen';
  final WalletChartsController controller = Get.find<WalletChartsController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<WalletChartsController>(builder: (_) {
        return controller.budget != null
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
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
                        child: PieChartWidget(controller: controller),
                      ),
                    ),
                  ),
                  ChartContainer(
                    spots: controller.expensespots,
                    title: 'Expenses',
                  ),
                  ChartContainer(
                    spots: controller.incomespots,
                    title: 'Incomes',
                  ),
                  ChartContainer(
                    spots: controller.debtspots,
                    title: 'Debts',
                  ),
                ],
              )
            : SizedBox(
                height: Get.height * 0.4,
                child: Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              );
      }),
    );
  }
}
