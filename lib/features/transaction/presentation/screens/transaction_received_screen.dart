import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../dashboard/presentation/screens/transaction_charts_screen.dart';
import '../getx/controllers/transaction_controller.dart';
import '../widgets/trabsaction_sent.dart';

class TransactionReceivedScreen extends StatelessWidget {
  TransactionReceivedScreen({super.key});
  static const String routeName = '/transaction/received';
  final TransactionController controller = Get.find<TransactionController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Image.asset('assets/images/transaction.png', height: 100),
        const Divider(
          color: Colors.grey,
        ),
        const Text('Transaction Received'),
        const Gap(20),
        GetBuilder<TransactionController>(
          builder: (_) => controller.receivedtransactions == null
              ? Center(child: ReloadBox(onPressed: controller.getTransactions))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.receivedtransactions!.length,
                  itemBuilder: (context, index) {
                    final transaction = controller.receivedtransactions![index];
                    return TransactionCard(
                      title: 'From : ${transaction.recipient}',
                      value: '+ ${transaction.value}',
                      image: 'assets/images/cashback.png',
                      onTap: () {
                        Get.defaultDialog(
                          title: 'Transaction Details',
                          content: Text(
                            'Title : ${transaction.title}\n'
                            'Value : ${transaction.value}\n'
                            'Note : ${transaction.note}\n'
                            'Date : ${transaction.date}\n',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('Close'),
                            ),
                          ],
                          backgroundColor: Colors.teal[100],
                          barrierDismissible: true,
                        );
                      },
                      color: Colors.green[300],
                      date: transaction.date,
                    );
                  },
                ),
        ),
        // TransactionCard(
        //   title: 'From Address : Alice',
        //   value: '+ 5000',
        //   image: 'assets/images/cashback.png',
        //   onTap: () {},
        //   color: Colors.green[300],
        // ),
      ]),
    );
  }
}
