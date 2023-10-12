import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../app/utils/constants/reloaad_box.dart';
import '../getx/controllers/transaction_controller.dart';
import '../widgets/trabsaction_sent.dart';

class TransactionSentScreen extends StatelessWidget {
  TransactionSentScreen({super.key});
  static const String routeName = '/transaction/sent';
  final TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Image.asset('assets/images/transaction.png', height: 100),
        const Divider(
          color: Colors.grey,
        ),
        const Text('Transaction Sent'),
        const Gap(20),
        GetBuilder<TransactionController>(
          builder: (_) => transactionController.senttransactions == null
              ? Center(
                  child: ReloadBox(
                      onPressed: transactionController.getTransactions))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactionController.senttransactions!.length,
                  itemBuilder: (context, index) {
                    final transaction =
                        transactionController.senttransactions![index];
                    return TransactionCard(
                      title: 'To : ${transaction.recipient}',
                      value: '- ${transaction.value}',
                      image: 'assets/images/loss.png',
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('Close'),
                            ),
                          ],
                          barrierDismissible: true,
                        );
                      },
                      color: Colors.red.withOpacity(0.8),
                      date: transaction.date,
                    );
                  },
                ),
        ),
      ]),
    );
  }
}
