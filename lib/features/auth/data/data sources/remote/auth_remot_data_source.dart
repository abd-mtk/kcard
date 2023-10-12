import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../app/errors/auth/excptions.dart';
import '../../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> register(AuthModel auth);
  Future<Unit> login(AuthModel auth);
  Future<Unit> logout();
}

class AuthRemoteDataSourceImplement implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImplement();

  @override
  Future<Unit> login(AuthModel auth) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: auth.email, password: auth.password);
      return Future.value(unit);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw AuthUserNotFoundException();
      } else if (error.code == 'wrong-password') {
        throw AuthWrongPasswordException();
      } else if (error.code == 'invalid-email') {
        throw AuthEmailNotVaildException();
      } else if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        throw AuthEmailNotVerifiedException;
      }
      throw AuthServerException;
    }
  }

  @override
  Future<Unit> logout() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
      await FirebaseAuth.instance.signOut();
      return Future.value(unit);
    } on FirebaseAuthException {
      throw AuthServerException;
    }
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
        throw AuthWeakPasswordException();
      } else if (error.code == 'email-already-in-use') {
        throw AuthEmailAlreadyInUseException();
      } else if (error.code == 'invalid-email') {
        throw AuthEmailNotVaildException();
      }
      throw AuthServerException;
    }
  }
}
