import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../getx/controllers/transaction_controller.dart';
import '../widgets/transaction_edit.dart';
import '../widgets/transaction_made_button.dart';
import '../widgets/transaction_type.dart';

class TransactionEditScreen extends StatelessWidget {
  TransactionEditScreen({super.key});
  static const String routeName = '/transaction/edit';
  final TransactionController controller = Get.find<TransactionController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Image.asset('assets/images/transaction2.png', height: 100),
        const Divider(
          color: Colors.grey,
        ),
        const Gap(20),
        const Text('Transaction Type', style: TextStyle(fontSize: 18)),
        const Divider(
          color: Colors.black,
        ),
        TransactionType(
          type: controller.transactionType,
          resipient: controller.transactionrecipient,
        ),
        EditTransctionFiled(
          label: 'Transaction Title',
          icon: Icons.title,
          controller: controller.transactionTitle,
          keyboardType: TextInputType.text,
        ),
        const Gap(20),
        EditTransctionFiled(
          label: 'Transaction Value',
          icon: Iconsax.money,
          controller: controller.transactionValue,
          keyboardType: TextInputType.number,
        ),
        const Gap(20),
        EditTransctionFiled(
          label: 'Transaction Note',
          icon: Iconsax.note,
          controller: controller.transactionNote,
          keyboardType: TextInputType.text,
          maxLines: 5,
          maxChars: 255,
        ),
        const Gap(20),
        TransactionMadeButton(
          onPressed: () {
            controller.createTransaction();
          },
        ),
      ]),
    );
  }
}
