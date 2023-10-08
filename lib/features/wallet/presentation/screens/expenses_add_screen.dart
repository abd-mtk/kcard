import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../getx/controllers/expenses_controller.dart';
import '../widgets/category_list.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/expenses_add.dart';

class ExpensesAddScreen extends StatelessWidget {
  ExpensesAddScreen({super.key});
  static const routeName = '/expenses-add';
  final ExpensesController expensesController = Get.find<ExpensesController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Image.asset('assets/images/add.png', height: 150),
        const Divider(
          color: Colors.grey,
        ),
        ExpensesAddFiled(
          label: 'Title',
          icon: Iconsax.tag,
          controller: expensesController.titleController,
        ),
        ExpensesAddFiled(
          label: 'Value',
          icon: Iconsax.money,
          controller: expensesController.valueController,
          keyboardType: TextInputType.number,
        ),
        CustomDropDown(
          label: 'Category',
          items: category,
          controller: expensesController.categoryController,
          defaultItem: 0,
        ),
        ExpensesAddFiled(
          label: 'Note',
          icon: Iconsax.note,
          controller: expensesController.noteController,
          maxLines: 6,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            expensesController.addExpenses();
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
                Text('Add Expenses'),
                Icon(Iconsax.wallet_add_1),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
