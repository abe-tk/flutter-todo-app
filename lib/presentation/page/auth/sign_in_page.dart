import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../feature/auth/application/usecase/auth_usecase.dart';
import '../../../l10n/l10n.dart';
import '../../../routing/go_router.dart';
import '../../common_widget/app_snack_bar.dart';
import '../../common_widget/app_text_form_field.dart';
import '../../mixin/page_mixin.dart';

class SignInPage extends HookConsumerWidget with PageMixin {
  const SignInPage({super.key});

  static const name = 'sign_in';
  static const path = '/sign_in';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final authUseCase = ref.watch(authUseCaseProvider);
    final emailController = useTextEditingController();
    final pwdController = useTextEditingController();
    final pwdObscureText = useState(true);

    String exceptionMessage(String? errorCode) {
      // signInWithEmailAndPassword()のエラーコードに対応する多言語化メッセージを返す
      // https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
      final message = switch (errorCode) {
        'invalid-credential' => l10n.invalidCredential,
        'invalid-email' => l10n.invalidEmail,
        'user-disabled' => l10n.userDisabled,
        _ => l10n.unexpectedError,
      };
      return message;
    }

    Future<void> signIn() async {
      await execute(
        context,
        ref,
        action: () async {
          await authUseCase.signInWithEmailAndPassword(
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
              const Gap(24),
              ElevatedButton(onPressed: signIn, child: Text(l10n.signIn)),
              const Gap(24),
              TextButton(
                onPressed: () {
                  const SignUpPageRoute().go(context);
                },
                child: Text(l10n.signUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
