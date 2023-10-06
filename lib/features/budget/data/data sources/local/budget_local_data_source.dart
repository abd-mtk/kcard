import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../app/errors/excptions.dart';
import '../../../domain/entities/budget.dart';
import '../../models/budget_model.dart';

abstract class BudgetLocalDataSource {
  Future<Budget> getBudget();
  Future<Unit> cacheBudget(BudgetModel budget);
}

const String cachedBudget = 'CACHED_BUDGET';

class BudgetLocalDataSourceImplement implements BudgetLocalDataSource {
  final SharedPreferences sharedPreferences;

  BudgetLocalDataSourceImplement({required this.sharedPreferences});
  @override
  Future<Unit> cacheBudget(BudgetModel budget) {
    try {
      sharedPreferences.setString(cachedBudget, json.encode(budget.toJson()));
      return Future.value(unit);
    } on CacheException {
      throw SaveDataException();
    }
  }

  @override
  Future<Budget> getBudget() {
    try {
      final jsonString = sharedPreferences.getString(cachedBudget);
      if (jsonString != null) {
        final budget = BudgetModel.fromJson(json.decode(jsonString));
        return Future.value(budget);
      } else {
        throw NoDataException();
      }
    } on CacheException {
      throw CacheException();
    }
  }
}
