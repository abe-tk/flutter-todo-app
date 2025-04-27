import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../usecase/auth_usecase.dart';

part 'auth_state.g.dart';

@riverpod
Stream<User?> authState(Ref ref) {
  final useCase = ref.watch(authUseCaseProvider);
  return useCase.authStateChanges();
}
