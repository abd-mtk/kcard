import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../app/errors/excptions.dart';
import '../../../domain/entities/transaction.dart';
import '../../models/transaction_model.dart';

abstract class TransactionLocalDataSource {
  Future<Unit> cacheTransactions(List<TransactionModel> transactions);
  Future<Unit> deleteTransaction(String id);
  Future<List<Transaction>> getTransactions();
}

const String CACHED_TRANSACTION = 'CACHED_TRANSACTION';

class TransactionLocalDataSourceImplement
    implements TransactionLocalDataSource {
  final SharedPreferences sharedPreferences;

  TransactionLocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<Unit> cacheTransactions(List<TransactionModel> transactions) {
    try {
      List transactionsList = transactions
          .map<Map<String, dynamic>>((transactions) => transactions.toJson())
          .toList();
      sharedPreferences.setString(
          CACHED_TRANSACTION, json.encode(transactionsList));
      return Future.value(unit);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<Unit> deleteTransaction(String id) {
    List<String>? transactionsList =
        sharedPreferences.getStringList(CACHED_TRANSACTION);
    if (transactionsList != null) {
      transactionsList.removeWhere(
          (element) => TransactionModel.fromJson(jsonDecode(element)).id == id);
      sharedPreferences.setStringList(CACHED_TRANSACTION, transactionsList);
      return Future.value(unit);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<Transaction>> getTransactions() {
    final jsonString = sharedPreferences.getString(CACHED_TRANSACTION);
    if (jsonString != null) {
      final List transactionsList = json.decode(jsonString) as List;
      final List<Transaction> transactions = [];
      for (var element in transactionsList) {
        transactions.add(TransactionModel.fromJson(element));
      }
      return Future.value(transactions);
    } else {
      throw CacheException();
    }
  }
}
