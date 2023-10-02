import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/auth/excptions.dart';
import '../../models/auth_model.dart';

abstract class RemoteDataSource {
  Future<Unit> register(AuthModel auth);
  Future<Unit> login(AuthModel auth);
  Future<Unit> logout();
}

class RemoteDataSourceImpl implements RemoteDataSource {
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
}
