import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/excptions.dart';
import '../../../domain/entities/expenses.dart';
import '../../models/expenses_model.dart';

abstract class ExpensesRemoteDataSource {
  Future<List<Expenses>> getExpenses();
  Future<Unit> addExpenses(ExpensesModel expenses);
  Future<Unit> deleteExpenses(String expensesId);
  Future<Unit> updateExpenses(ExpensesModel expenses);
}

class ExpensesRemoteDataSourceImplement implements ExpensesRemoteDataSource {
  final String uid;

  ExpensesRemoteDataSourceImplement({required this.uid});
  @override
  Future<Unit> addExpenses(ExpensesModel expenses) async {
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Expenses")
          .add(expenses.toJson());
      return Future.value(unit);
    } on FirebaseException {
      throw SaveDataException();
    }
  }

  @override
  Future<Unit> deleteExpenses(String expensesId) async {
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Expenses")
          .doc(expensesId)
          .delete();
      return Future.value(unit);
    } on FirebaseException {
      throw DeleteDataException();
    }
  }

  @override
  Future<List<Expenses>> getExpenses() async {
    try {
      final expenses = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Expenses")
          .get();
      if (expenses.docs.isNotEmpty) {
        final List<Expenses> expensesList = [];
        for (var element in expenses.docs) {
          expensesList.add(ExpensesModel.fromJson(element.data()));
        }
        return expensesList;
      } else {
        return [];
      }
    } on FirebaseException {
      throw GetDateException();
    }
  }

  @override
  Future<Unit> updateExpenses(ExpensesModel expenses) async {
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Expenses")
          .doc(expenses.id.toString())
          .update(expenses.toJson());
      return Future.value(unit);
    } on FirebaseException {
      throw UpdateDataException();
    }
  }
}
