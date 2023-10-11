import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:kcard/app/errors/excptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/payment.dart';
import '../../models/payment_model.dart';

abstract class PaymentsLocalDataSource {
  Future<List<Payment>> getPayment();
  Future<Unit> cachePayment(List<PaymentModel> payment);
  Future<Unit> deletePayment(String id);
  Future<Unit> updatePayment(PaymentModel payment);
}

const String cachedPayment = 'CACHED_PAYMENT';

class PaymentLocalDataSourceImplement implements PaymentsLocalDataSource {
  final SharedPreferences sharedPreferences;

  PaymentLocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<List<Payment>> getPayment() {
    final jsonString = sharedPreferences.getString(cachedPayment);
    if (jsonString != null) {
      final List paymentList = json.decode(jsonString) as List;
      final List<Payment> payment = [];
      for (var element in paymentList) {
        payment.add(PaymentModel.fromJson(element));
      }
      return Future.value(payment);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<Unit> cachePayment(List<PaymentModel> Payment) {
    try {
      List paymentList =
          Payment.map<Map<String, dynamic>>((Payment) => Payment.toJson())
              .toList();
      sharedPreferences.setString(cachedPayment, json.encode(paymentList));
      return Future.value(unit);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<Unit> deletePayment(String id) {
    List<String>? paymentList = sharedPreferences.getStringList(cachedPayment);
    if (paymentList != null) {
      paymentList.removeWhere(
          (element) => PaymentModel.fromJson(jsonDecode(element)).id == id);
      sharedPreferences.setStringList(cachedPayment, paymentList);
      return Future.value(unit);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<Unit> updatePayment(PaymentModel Payment) {
    List<String>? paymentList = sharedPreferences.getStringList(cachedPayment);
    if (paymentList != null) {
      paymentList.removeWhere((element) =>
          PaymentModel.fromJson(jsonDecode(element)).id == Payment.id);
      paymentList.add(jsonEncode(Payment.toJson()));
      sharedPreferences.setStringList(cachedPayment, paymentList);
      return Future.value(unit);
    } else {
      throw CacheException();
    }
  }
}
