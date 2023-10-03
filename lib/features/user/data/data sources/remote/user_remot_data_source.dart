import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/auth/excptions.dart';
import '../../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<Unit> saveUserInformation(UserModel user);
  Future<Unit> updateUserInformation(UserModel user);
  Future<Unit> deleteUserInformation();
}

class RemoteDataSourceImplement implements UserRemoteDataSource {
  RemoteDataSourceImplement();
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<Unit> saveUserInformation(UserModel user) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Information")
          .add(
            user.toJson(),
          );
      return Future.value(unit);
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw ServerException;
    }
  }

  @override
  Future<Unit> updateUserInformation(UserModel user) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("Information")
          .doc("MyInformation")
          .update(
            user.toJson(),
          );
      return Future.value(unit);
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw ServerException;
    }
  }

  @override
  Future<Unit> deleteUserInformation() async {
    try {
      await FirebaseFirestore.instance.collection("Users").doc(uid).delete();
      return Future.value(unit);
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw ServerException;
    }
  }
}
