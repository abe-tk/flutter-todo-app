import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infra/auth_repository.dart';

part 'auth_usecase.g.dart';

@riverpod
AuthUseCase authUseCase(Ref ref) {
  return AuthUseCase(
    repository: AuthRepository(fireAuth: FirebaseAuth.instance),
  );
}

class AuthUseCase {
  AuthUseCase({required this.repository});

  final AuthRepository repository;

  Stream<User?> authStateChanges() {
    return repository.authStateChanges();
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String pwd,
  }) async {
    await repository.createUserWithEmailAndPassword(email: email, pwd: pwd);
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String pwd,
  }) async {
    await repository.signInWithEmailAndPassword(email: email, pwd: pwd);
  }

  Future<void> signOut() async {
    await repository.signOut();
  }
}
