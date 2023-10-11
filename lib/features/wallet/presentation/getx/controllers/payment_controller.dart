import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/payment.dart';
import '../../../domain/use cases/add_payment.dart';
import '../../../domain/use cases/delete_payment.dart';
import '../../../domain/use cases/get_payment.dart';
import '../../../domain/use cases/update_payment.dart';
import 'budget_controller.dart';

class PaymentController extends GetxController {
  GetPaymentUseCase getPaymentUseCase;
  AddPaymenUseCase addPaymentUseCase;
  DeletePaymentUseCase deletePaymentUseCase;
  UpdatePaymentUseCase updatePaymentUseCase;

  PaymentController({
    required this.getPaymentUseCase,
    required this.addPaymentUseCase,
    required this.deletePaymentUseCase,
    required this.updatePaymentUseCase,
  });

  Payment? payment;
  List<Payment> paymentlist = [];
  BudgetController budgetController = Get.find<BudgetController>();
  TextEditingController titleController = TextEditingController();
  TextEditingController valueController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  Future<void> getpayment() async {
    final result = await getPaymentUseCase.call();
    result.fold(
      (failure) {
        // Get.snackbar(
        //   'Error',
        //   failure.runtimeType.toString(),
        //   snackPosition: SnackPosition.TOP,
        // );
      },
      (data) {
        paymentlist = data;
        // Get.snackbar(
        //   'Success',
        //   'payment loaded successfully',
        //   snackPosition: SnackPosition.TOP,
        // );
        update();
      },
    );
  }

  Future<void> addPayment() async {
    Payment payment = Payment(
      title: titleController.text,
      value: double.parse(valueController.text),
      category:
          categoryController.text.isEmpty ? "Payment" : categoryController.text,
      note: noteController.text,
      date: DateTime.now().toString(),
    );
    final result = await addPaymentUseCase.call(payment);
    result.fold(
      (failure) {
        Get.snackbar(
          'Error',
          failure.runtimeType.toString(),
          snackPosition: SnackPosition.TOP,
        );
      },
      (data) {
        paymentlist.add(payment);
        editWallet(categoryController.text);
        clear();
        update();
      },
    );
  }

  Future<void> deletePayment(Payment payment) async {
    final result = await deletePaymentUseCase.call(payment.id!);
    result.fold(
      (failure) => Get.snackbar(
        'Error',
        failure.runtimeType.toString(),
        snackPosition: SnackPosition.TOP,
      ),
      (data) {
        paymentlist.remove(payment);
        update();
      },
    );
  }

  Future<void> updatePayment(Payment payment) async {
    final result = await updatePaymentUseCase.call(payment);
    result.fold(
      (failure) => Get.snackbar(
        'Error',
        failure.runtimeType.toString(),
        snackPosition: SnackPosition.TOP,
      ),
      (data) {
        paymentlist.removeWhere((element) => element.id == payment.id);
        paymentlist.add(payment);
        update();
      },
    );
  }

  @override
  void onInit() {
    getpayment();
    super.onInit();
  }

  void clear() {
    titleController.clear();
    valueController.clear();
    categoryController.clear();
    noteController.clear();
  }

  void editWallet(String value) {
    if (value == "Payment") {
      budgetController.currentBudgetController.text =
          (double.parse(budgetController.currentBudgetController.text) -
                  double.parse(valueController.text))
              .toString();
      budgetController.paymentController.text =
          (double.parse(budgetController.paymentController.text) +
                  double.parse(valueController.text))
              .toString();
    } else if (value == "Income") {
      budgetController.currentBudgetController.text =
          (double.parse(budgetController.currentBudgetController.text) +
                  double.parse(valueController.text))
              .toString();
      budgetController.incomeController.text =
          (double.parse(budgetController.incomeController.text) +
                  double.parse(valueController.text))
              .toString();
    } else if (value == "Debt") {
      budgetController.currentBudgetController.text =
          (double.parse(budgetController.currentBudgetController.text) +
                  double.parse(valueController.text))
              .toString();
      budgetController.debtController.text =
          (double.parse(budgetController.debtController.text) +
                  double.parse(valueController.text))
              .toString();
    }
    budgetController.updateBudget();
    budgetController.getBudget();
  }
}
