import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kcard/features/transaction/domain/entities/transaction.dart';

import '../../../../wallet/presentation/getx/controllers/budget_controller.dart';
import '../../../domain/use cases/create_transaction.dart';
import '../../../domain/use cases/delete_transaction.dart';
import '../../../domain/use cases/get_transactions.dart';

class TransactionController extends GetxController {
  final GetTrnsctionsUseCase getTrnsctionsUseCase;
  final CreateTrnsctionsUseCase createTrnsctionsUseCase;
  final DeleteTrnsctionsUseCase deleteTrnsctionsUseCase;
  final BudgetController budgetController = Get.find<BudgetController>();

  TransactionController({
    required this.getTrnsctionsUseCase,
    required this.createTrnsctionsUseCase,
    required this.deleteTrnsctionsUseCase,
  });

  Transaction? transaction;
  List<Transaction>? senttransactions;
  List<Transaction>? receivedtransactions;

  TextEditingController transactionType = TextEditingController();
  TextEditingController transactionrecipient = TextEditingController();
  TextEditingController transactionTitle = TextEditingController();
  TextEditingController transactionValue = TextEditingController();
  TextEditingController transactionNote = TextEditingController();
  TextEditingController transactionDate = TextEditingController();

  Future<void> getTransactions() async {
    final result = await getTrnsctionsUseCase();
    result.fold(
      (l) => Get.snackbar('Error', l.runtimeType.toString()),
      (r) {
        senttransactions =
            r.where((element) => element.type == 'Send').toList();
        receivedtransactions =
            r.where((element) => element.type == 'Receive').toList();
        update();
      },
    );
  }

  Future<void> createTransaction() async {
    if (transactionType.text.isEmpty ||
        transactionType.text.isEmpty ||
        transactionTitle.text.isEmpty ||
        transactionValue.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.pink[400],
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          titleText: const Text(
            'Error',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: const Text(
            'Please fill all fields',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ));
      return;
    }
    final result = await createTrnsctionsUseCase(
      Transaction(
        type: transactionType.text,
        recipient: transactionrecipient.text,
        title: transactionTitle.text,
        value: double.parse(transactionValue.text),
        note: transactionNote.text,
        date: DateTime.now().toString(),
      ),
    );
    result.fold(
      (l) {
        Get.snackbar('Error', l.runtimeType.toString());
      },
      (r) {
        Get.snackbar('Success', 'Transaction Created');

        getTransactions();
        if (transactionType.text == 'Receive') {
          ;
          budgetController.receive(transactionValue.text);
        } else {
          budgetController.send(transactionValue.text);
        }
        update();
        clearText();
      },
    );
  }

  Future<void> deleteTransaction(String id) async {
    final result = await deleteTrnsctionsUseCase(id);
    result.fold(
      (l) => Get.snackbar('Error', l.runtimeType.toString()),
      (r) {
        Get.snackbar('Success', 'Transaction Deleted');
        update();
      },
    );
  }

  void clearText() {
    transactionType.clear();
    transactionrecipient.clear();
    transactionTitle.clear();
    transactionValue.clear();
    transactionNote.clear();
    transactionDate.clear();
  }

  @override
  void onInit() {
    getTransactions();
    super.onInit();
  }
}
