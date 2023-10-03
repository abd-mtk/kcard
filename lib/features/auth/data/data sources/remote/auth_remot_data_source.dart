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
  final String uid;
  const RemoteDataSourceImplement(this.uid);

  @override
  Future<Unit> login(AuthModel auth) {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
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
  Future<Unit> logout() {
    FirebaseAuth.instance.signOut();
    return Future.value(unit);
  }

  @override
  Future<Unit> register(AuthModel auth) {
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: auth.email, password: auth.password);
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
  Future<Unit> saveUserInformation(UserModel user) {
    try {
      FirebaseFirestore.instance
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
  Future<Unit> updateUserInformation(UserModel user) {
    try {
      FirebaseFirestore.instance
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
  Future<Unit> deleteUserInformation() {
    try {
      FirebaseFirestore.instance.collection("Users").doc(uid).delete();
      return Future.value(unit);
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      throw ServerException;
    }
  }
}
