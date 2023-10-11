import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:flutter/foundation.dart';

import '../../../../../app/errors/excptions.dart';
import '../../../../transaction/data/models/transaction_model.dart';
import '../../../../transaction/domain/entities/transaction.dart';
import '../../../../wallet/data/models/budget_model.dart';
import '../../../../wallet/data/models/payment_model.dart';
import '../../../../wallet/domain/entities/budget.dart';
import '../../../../wallet/domain/entities/payment.dart';
import '../../../domain/entities/dashboard.dart';

abstract class DashboardRemoteDataSource {
  Future<Dashboard> getDashboard();
}

class DashboardRemoteDataSourceImplement implements DashboardRemoteDataSource {
  final String uid;
  const DashboardRemoteDataSourceImplement({required this.uid});
  @override
  Future<Dashboard> getDashboard() async {
    try {
      final budget = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Budget")
          .doc("Budget")
          .get();
      final payment = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Payments")
          .get();
      final transactions = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Transactions")
          .get();

      if (kDebugMode) {
        // print("budget.exists ${budget.exists}");
        // print(budget.data());
        // print("payment docs is Empty ${payment.docs.isEmpty}");
        // print(payment.docs);
        // print("transactions docs is Empty ${transactions.docs.isEmpty}");
        // print(transactions.docs);
      }

      final Budget budgetData = BudgetModel.fromJson(budget.data()!);
      final List<Payment> paymentList = [];
      for (var element in payment.docs) {
        paymentList.add(PaymentModel.fromJson(element.data()));
      }

      final List<Transaction> transactionsList = [];
      for (var element in transactions.docs) {
        transactionsList.add(TransactionModel.fromJson(element.data()));
      }

      return Dashboard(
          budget: budgetData,
          payment: paymentList,
          transaction: transactionsList);
    } on FirebaseException {
      throw GetDateException();
    }
  }
}
