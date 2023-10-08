import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/expenses.dart';

class ExpensesCard extends StatelessWidget {
  final Expenses expenses;
  final String? image;

  const ExpensesCard({
    Key? key,
    required this.expenses,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${expenses.category} : ",
                      style: const TextStyle(fontSize: 18)),
                  Text(expenses.title, style: const TextStyle(fontSize: 18)),
                  const Spacer(),
                  image != null ? Image.asset(image!, height: 30) : Container(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Time : ${expenses.date.toString().split(' ')[0]}",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  Text("Value : ${expenses.value}",
                      style: const TextStyle(fontSize: 18)),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.8,
                    child: Text(
                      "Note : ${expenses.note}",
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
