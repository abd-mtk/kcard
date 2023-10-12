import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/payment.dart';

class PaymentCard extends StatelessWidget {
  final Payment payment;
  final String? image;

  const PaymentCard({
    Key? key,
    required this.payment,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${payment.category} : ",
                      style: const TextStyle(fontSize: 18)),
                  Text(payment.title, style: const TextStyle(fontSize: 18)),
                  const Spacer(),
                  image != null ? Image.asset(image!, height: 30) : Container(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Time : ${payment.date.toString().split(' ')[0]}",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Text("Value : ${payment.value}",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.8,
                    child: Text(
                      "Note : ${payment.note}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
