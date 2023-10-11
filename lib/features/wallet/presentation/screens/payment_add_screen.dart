import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../getx/controllers/payment_controller.dart';
import '../widgets/category_list.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/payment_add_filed.dart';

class PaymentAddScreen extends StatelessWidget {
  PaymentAddScreen({super.key});
  static const routeName = '/payment-add-screen';
  final PaymentController paymentController = Get.find<PaymentController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Image.asset('assets/images/add.png', height: 150),
        const Divider(
          color: Colors.grey,
        ),
        PaymentAddFiled(
          label: 'Title',
          icon: Iconsax.tag,
          controller: paymentController.titleController,
        ),
        PaymentAddFiled(
          label: 'Value',
          icon: Iconsax.money,
          controller: paymentController.valueController,
          keyboardType: TextInputType.number,
        ),
        CustomDropDown(
          label: 'Category',
          items: category,
          controller: paymentController.categoryController,
          defaultItem: 0,
        ),
        PaymentAddFiled(
          label: 'Note',
          icon: Iconsax.note,
          controller: paymentController.noteController,
          maxLines: 6,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            paymentController.addPayment();
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2,
          ),
          child: SizedBox(
            width: Get.width * 0.3,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Add Payment'),
                Icon(Iconsax.wallet_add_1),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
