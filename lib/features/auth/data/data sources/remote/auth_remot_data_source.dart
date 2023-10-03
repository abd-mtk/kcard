import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/auth/excptions.dart';
import '../../models/auth_model.dart';
import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> register(AuthModel auth);
  Future<Unit> login(AuthModel auth);
  Future<Unit> logout();
  Future<Unit> saveUserInformation(UserModel user);
  Future<Unit> updateUserInformation(UserModel user);
  Future<Unit> deleteUserInformation();
}

class RemoteDataSourceImplement implements AuthRemoteDataSource {
  const RemoteDataSourceImplement();

  @override
  Future<Unit> login(AuthModel auth) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: auth.email, password: auth.password);
      return Future.value(unit);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw UserNotFoundException();
      } else if (error.code == 'wrong-password') {
        throw WrongPasswordException();
      } else if (error.code == 'invalid-email') {
        throw EmailNotVaildException();
      } else if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        throw EmailNotVerifiedException;
      }
      throw ServerException;
    }
  }

  @override
  Future<Unit> logout() async {
    await FirebaseAuth.instance.signOut();
    return Future.value(unit);
  }

  @override
  Future<Unit> register(AuthModel auth) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: auth.email, password: auth.password);
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();

      return Future.value(unit);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (error.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      } else if (error.code == 'invalid-email') {
        throw EmailNotVaildException();
      }
      throw ServerException;
    }
  }

  @override
  Future<Unit> saveUserInformation(UserModel user) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
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
    final uid = FirebaseAuth.instance.currentUser!.uid;

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
    final uid = FirebaseAuth.instance.currentUser!.uid;

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
