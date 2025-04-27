import 'package:firebase_auth/firebase_auth.dart';

import '../../../util/exception/app_exception.dart';

class AuthRepository {
  AuthRepository({required FirebaseAuth fireAuth}) : _fireAuth = fireAuth;

  final FirebaseAuth _fireAuth;

  /// 認証状態をリアルタイムで取得する
  Stream<User?> authStateChanges() {
    try {
      return _fireAuth.authStateChanges();
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }

  /// メールアドレスによるSignUp
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String pwd,
  }) async {
    try {
      await _fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
    } on FirebaseAuthException catch (e) {
      throw AppException(code: e.code, message: e.toString());
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }

  /// メールアドレスによるSignIn
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String pwd,
  }) async {
    try {
      await _fireAuth.signInWithEmailAndPassword(email: email, password: pwd);
    } on FirebaseAuthException catch (e) {
      throw AppException(code: e.code, message: e.toString());
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }

  /// SignOut
  Future<void> signOut() async {
    try {
      await _fireAuth.signOut();
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }
}
