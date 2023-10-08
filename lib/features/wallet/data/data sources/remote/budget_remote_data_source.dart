import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/excptions.dart';
import '../../../domain/entities/budget.dart';
import '../../models/budget_model.dart';

abstract class BudgetRemoteDataSource {
  Future<Budget> getBudget();
  Future<Unit> updateBudget(BudgetModel budget);
}

class BudgetRemoteDataSourceImplement implements BudgetRemoteDataSource {
  final String uid;
  BudgetRemoteDataSourceImplement({required this.uid});

  @override
  Future<Budget> getBudget() async {
    try {
      final budget = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Budget")
          .doc("Budget")
          .get();
      if (budget.data() != null) {
        return BudgetModel.fromJson(budget.data()!);
      } else {
        throw NoDataException();
      }
    } on FirebaseException {
      throw GetDateException();
    }
  }

  @override
  Future<Unit> updateBudget(BudgetModel budget) async {
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Budget")
          .doc("Budget")
          .set(budget.toJson(), SetOptions(merge: true));
      return Future.value((unit));
    } on FirebaseException {
      throw UpdateDataException();
    }
  }
}
