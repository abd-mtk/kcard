import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/excptions.dart';
import '../../../domain/entities/payment.dart';
import '../../models/payment_model.dart';

abstract class PaymentRemoteDataSource {
  Future<List<Payment>> getPayment();
  Future<Unit> addPayment(PaymentModel payment);
  Future<Unit> deletePayment(String paymentId);
  Future<Unit> updatePayment(PaymentModel payment);
}

class PaymentRemoteDataSourceImplement implements PaymentRemoteDataSource {
  final String uid;

  PaymentRemoteDataSourceImplement({required this.uid});
  @override
  Future<Unit> addPayment(PaymentModel payment) async {
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Payments")
          .add(payment.toJson());
      return Future.value(unit);
    } on FirebaseException {
      throw SaveDataException();
    }
  }

  @override
  Future<Unit> deletePayment(String paymentId) async {
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Payment")
          .doc(paymentId)
          .delete();
      return Future.value(unit);
    } on FirebaseException {
      throw DeleteDataException();
    }
  }

  @override
  Future<List<Payment>> getPayment() async {
    try {
      final payment = await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Payment")
          .get();
      if (payment.docs.isNotEmpty) {
        final List<Payment> paymentList = [];
        for (var element in payment.docs) {
          paymentList.add(PaymentModel.fromJson(element.data()));
        }
        return paymentList;
      } else {
        return [];
      }
    } on FirebaseException {
      throw GetDateException();
    }
  }

  @override
  Future<Unit> updatePayment(PaymentModel payment) async {
    try {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Payment")
          .doc(payment.id.toString())
          .update(payment.toJson());
      return Future.value(unit);
    } on FirebaseException {
      throw UpdateDataException();
    }
  }
}
