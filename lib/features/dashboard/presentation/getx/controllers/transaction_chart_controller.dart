import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../../transaction/domain/use cases/get_transactions.dart';

class TransactionChartsController extends GetxController {
  GetTrnsactionsUseCase getTransactionsUseCase;

  TransactionChartsController({required this.getTransactionsUseCase});

  List<FlSpot> sendSpots = [];
  List<FlSpot> receiveSpots = [];

  double maxvsentalue = 0;
  double maxreceivedvalue = 0;

  void getTransactions() async {
    final result = await getTransactionsUseCase();
    result.fold(
      (l) => Get.snackbar('Error', l.runtimeType.toString()),
      (r) {
        final senttransactions =
            r.where((element) => element.type == 'Send').toList();
        final receivedtransactions =
            r.where((element) => element.type == 'Receive').toList();

        final sentvalues = senttransactions.map((e) => e.value).toList();
        final receivedvalues =
            receivedtransactions.map((e) => e.value).toList();
        // print("sentvalues");
        // print(sentvalues);
        // print("receivedvalues");
        // print(receivedvalues);

        for (var i = 0; i < sentvalues.length; i++) {
          sendSpots.add(FlSpot(i.toDouble(), sentvalues[i]));
        }
        for (var i = 0; i < receivedvalues.length; i++) {
          receiveSpots.add(FlSpot(i.toDouble(), receivedvalues[i]));
        }
        maxvsentalue = sentvalues.reduce((value, element) => value + element);
        maxreceivedvalue =
            receivedvalues.reduce((value, element) => value + element);

        update();
      },
    );
  }

  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }
}
