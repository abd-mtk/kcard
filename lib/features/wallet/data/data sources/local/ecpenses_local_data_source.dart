import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:kcard/app/errors/excptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/expenses.dart';
import '../../models/expenses_model.dart';

abstract class ExpensesLocalDataSource {
  Future<List<Expenses>> getExpenses();
  Future<Unit> cacheExpenses(List<ExpensesModel> expenses);
  Future<Unit> deleteExpenses(String id);
  Future<Unit> updateExpenses(ExpensesModel expenses);
}

const String cachedExpenses = 'CACHED_EXPENSES';

class ExpensesLocalDataSourceImplement implements ExpensesLocalDataSource {
  final SharedPreferences sharedPreferences;

  ExpensesLocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<List<Expenses>> getExpenses() {
    final jsonString = sharedPreferences.getString(cachedExpenses);
    if (jsonString != null) {
      final List expensesList = json.decode(jsonString) as List;
      final List<Expenses> expenses = [];
      for (var element in expensesList) {
        expenses.add(ExpensesModel.fromJson(element));
      }
      return Future.value(expenses);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<Unit> cacheExpenses(List<ExpensesModel> expenses) {
    try {
      List expensesList = expenses
          .map<Map<String, dynamic>>((expenses) => expenses.toJson())
          .toList();
      sharedPreferences.setString(cachedExpenses, json.encode(expensesList));
      return Future.value(unit);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<Unit> deleteExpenses(String id) {
    List<String>? expensesList =
        sharedPreferences.getStringList(cachedExpenses);
    if (expensesList != null) {
      expensesList.removeWhere(
          (element) => ExpensesModel.fromJson(jsonDecode(element)).id == id);
      sharedPreferences.setStringList(cachedExpenses, expensesList);
      return Future.value(unit);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<Unit> updateExpenses(ExpensesModel expenses) {
    List<String>? expensesList =
        sharedPreferences.getStringList(cachedExpenses);
    if (expensesList != null) {
      expensesList.removeWhere((element) =>
          ExpensesModel.fromJson(jsonDecode(element)).id == expenses.id);
      expensesList.add(jsonEncode(expenses.toJson()));
      sharedPreferences.setStringList(cachedExpenses, expensesList);
      return Future.value(unit);
    } else {
      throw CacheException();
    }
  }
}
