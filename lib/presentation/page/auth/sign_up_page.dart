import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../feature/auth/application/usecase/auth_usecase.dart';
import '../../../l10n/l10n.dart';
import '../../common_widget/app_snack_bar.dart';
import '../../common_widget/app_text_form_field.dart';
import '../../mixin/page_mixin.dart';

class SignUpPage extends HookConsumerWidget with PageMixin {
  const SignUpPage({super.key});

  static const name = 'sign_up';
  static const path = 'sign_up';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final authUseCase = ref.watch(authUseCaseProvider);
    final emailController = useTextEditingController();
    final pwdController = useTextEditingController();
    final pwdObscureText = useState(true);

    String exceptionMessage(String? errorCode) {
      // createUserWithEmailAndPassword()のエラーコードに対応する多言語化メッセージを返す
      // https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
      final message = switch (errorCode) {
        'email-already-in-use' => l10n.emailAlreadyInUse,
        'invalid-email' => l10n.invalidEmail,
        'operation-not-allowed' => l10n.operationNotAllowed,
        'weak-password' => l10n.weakPassword,
        _ => l10n.unexpectedError,
      };
      return message;
    }

    Future<void> signUp() async {
      await execute(
        context,
        ref,
        action: () async {
          await authUseCase.createUserWithEmailAndPassword(
            email: emailController.text,
            pwd: pwdController.text,
          );
        },
        onExceptionCatch: (e) async {
          AppSnackBar.showError(
            context: context,
            message: exceptionMessage(e.code),
          );
        },
      );
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 24,
            children: [
              AppTextFormField(
                controller: emailController,
                icon: const Icon(Icons.email),
              ),
              AppTextFormField(
                controller: pwdController,
                icon: const Icon(Icons.key),
                obscureText: pwdObscureText.value,
                obscureChange: () {
                  pwdObscureText.value = !pwdObscureText.value;
                },
              ),
              ElevatedButton(onPressed: signUp, child: Text(l10n.signUp)),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(l10n.signIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
