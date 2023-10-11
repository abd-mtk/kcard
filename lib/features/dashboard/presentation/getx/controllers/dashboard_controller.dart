import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../../transaction/domain/entities/transaction.dart';
import '../../../../wallet/domain/entities/budget.dart';
import '../../../domain/entities/dashboard.dart';
import '../../../domain/use cases/get_dashboard.dart';

class DashboardController extends GetxController {
  GetDashboardUseCase getDashboardUsecase;

  DashboardController({required this.getDashboardUsecase});

  Dashboard? dashboard;
  Budget? budget;
  List<Transaction?>? transaction;

  List<FlSpot> paymentspots = [];
  List<FlSpot> incomespots = [];
  List<FlSpot> debtspots = [];

  List<double> paymentvalues = [];
  List<double> incomevalues = [];
  List<double> debtvalues = [];

  List<FlSpot> sendSpots = [];
  List<FlSpot> receiveSpots = [];

  double maxvsentvalue = 0;
  double maxreceivedvalue = 0;

  List<double> sentvalues = [];
  List<double> receivedvalues = [];

  Future<void> getDashboard() async {
    final result = await getDashboardUsecase();
    result.fold(
      (failure) {
        // print(" =============== Dashboard failure =============== ");
        // print(failure);
        // }
        // Get.snackbar('Error', failure.runtimeType.toString());
      },
      (dashboard) {
        if (dashboard.budget != null) {
          budget = dashboard.budget;
          if (dashboard.payment != null) {
            paymentSpots(dashboard);
            update();
          }
          update();
        }
        if (dashboard.transaction != null) {
          transaction = dashboard.transaction;
          transactionSpots(dashboard);
          transactionMaxValue();
          update();
        }
      },
    );
  }

  void transactionMaxValue() {
    try {
      maxvsentvalue = sentvalues.reduce((value, element) => value + element);
      maxreceivedvalue =
          receivedvalues.reduce((value, element) => value + element);
    } catch (Error) {}
  }

  void transactionSpots(Dashboard dashboard) {
    sentvalues = dashboard.transaction!
        .where((element) => element.type == 'Send')
        .map((e) => e.value)
        .toList();
    receivedvalues = dashboard.transaction!
        .where((element) => element.type == 'Receive')
        .map((e) => e.value)
        .toList();

    for (var i = 0; i < sentvalues.length; i++) {
      sendSpots.add(FlSpot(i.toDouble(), sentvalues[i]));
    }
    for (var i = 0; i < receivedvalues.length; i++) {
      receiveSpots.add(FlSpot(i.toDouble(), receivedvalues[i]));
    }
  }

  void paymentSpots(Dashboard dashboard) {
    paymentvalues = dashboard.payment!
        .where((element) => element.category == 'Payment')
        .map((e) => e.value)
        .toList();

    for (var i = 0; i < paymentvalues.length; i++) {
      paymentspots.add(FlSpot(i.toDouble(), paymentvalues[i]));
    }
    incomevalues = dashboard.payment!
        .where((element) => element.category == 'Income')
        .map((e) => e.value)
        .toList();
    for (var i = 0; i < incomevalues.length; i++) {
      incomespots.add(FlSpot(i.toDouble(), incomevalues[i]));
    }
    debtvalues = dashboard.payment!
        .where((element) => element.category == 'Debt')
        .map((e) => e.value)
        .toList();
    for (var i = 0; i < debtvalues.length; i++) {
      debtspots.add(FlSpot(i.toDouble(), debtvalues[i]));
    }
  }

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }
}
