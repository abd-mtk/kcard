import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/excptions.dart';
import '../../../domain/entities/transaction.dart';
import '../../models/transaction_model.dart';

abstract class TransactionRemoteDataSource {
  Future<Unit> createTransaction(TransactionModel transaction);
  Future<List<Transaction>> getTransactions();
  Future<Unit> updateTransaction(TransactionModel transaction);
  Future<Unit> deleteTransaction(String id);
}

class TransactionRemoteDataSourceImplement
    implements TransactionRemoteDataSource {
  final String uid;

  TransactionRemoteDataSourceImplement({required this.uid});

  @override
  Future<Unit> createTransaction(TransactionModel transaction) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Transactions")
          .add(transaction.toJson());
      return Future.value(unit);
    } on FirebaseException {
      throw SaveDataException();
    }
  }

  @override
  Future<Unit> deleteTransaction(String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Transactions")
          .doc(id)
          .delete();
      return Future.value(unit);
    } on FirebaseException {
      throw DeleteDataException();
    }
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    try {
      final transactions = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Transactions")
          .get();
      if (transactions.docs.isNotEmpty) {
        final List<Transaction> transactionsList = [];
        for (var element in transactions.docs) {
          transactionsList.add(TransactionModel.fromJson(element.data()));
        }
        return Future.value(transactionsList);
      } else {
        throw NoDataException();
      }
    } on FirebaseException {
      throw GetDateException();
    }
  }

  @override
  Future<Unit> updateTransaction(TransactionModel transaction) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Transactions")
          .doc(transaction.id)
          .update(transaction.toJson());
      return Future.value(unit);
    } on FirebaseException {
      throw UpdateDataException();
    }
  }
}
