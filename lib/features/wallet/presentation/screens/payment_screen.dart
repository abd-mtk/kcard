import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/utils/constants/reloaad_box.dart';
import '../getx/controllers/payment_controller.dart';
import '../widgets/payment_card.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});
  static const routeName = '/payment-screen';
  final PaymentController paymentController = Get.find<PaymentController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Image.asset('assets/images/expense2.png', height: Get.height * 0.2),
        const Divider(
          color: Colors.grey,
        ),
        paymentController.paymentlist.isEmpty
            ? Center(
                child: ReloadBox(onPressed: paymentController.getpayment),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: paymentController.paymentlist.length,
                itemBuilder: (context, index) {
                  return PaymentCard(
                    payment: paymentController.paymentlist[index],
                    image: 'assets/images/coin.png',
                  );
                },
              ),
      ]),
    );
  }
}
