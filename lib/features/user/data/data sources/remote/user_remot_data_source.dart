import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/user/excptions.dart';
import '../../../domain/entities/user.dart';
import '../../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<User> getUserInformation();
  Future<Unit> addUserInformation(UserModel user);
  Future<Unit> updateUserInformation(UserModel user);
  Future<Unit> deleteUserInformation();
}

class RemoteDataSourceImplement implements UserRemoteDataSource {
  RemoteDataSourceImplement();
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<User> getUserInformation() async {
    try {
      final user =
          await FirebaseFirestore.instance.collection("Users").doc(uid).get();
      if (user.data() != null) {
        return UserModel.fromJson(user.data()!);
      } else {
        throw UserNotFoundException();
      }
    } on FirebaseException {
      throw ServerException;
    }
  }

  @override
  Future<Unit> addUserInformation(UserModel user) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .set(user.toJson(), SetOptions(merge: true));
      return Future.value(unit);
    } on FirebaseException {
      throw ServerException;
    }
  }

  @override
  Future<Unit> updateUserInformation(UserModel user) async {
    try {
      await FirebaseFirestore.instance.collection("Users").doc(uid).update(
            user.toJson(),
          );
      return Future.value(unit);
    } on FirebaseException {
      throw ServerException;
    }
  }

  @override
  Future<Unit> deleteUserInformation() async {
    try {
      await FirebaseFirestore.instance.collection("Users").doc(uid).delete();
      return Future.value(unit);
    } on FirebaseException {
      throw ServerException;
    }
  }
}
