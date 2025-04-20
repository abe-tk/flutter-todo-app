import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../feature/todo/application/state/todo_list_state.dart';
import '../../../../feature/todo/application/usecase/todo_usecase.dart';
import '../../../../l10n/l10n.dart';
import '../../../../util/exception/app_exception.dart';
import '../../../../util/validator/todo_form_validator.dart';
import '../../../common_widget/app_date_time_picker.dart';
import '../../../common_widget/app_snack_bar.dart';
import '../../../common_widget/app_text_form_field.dart';
import '../../../mixin/page_mixin.dart';
import '../notifier/todo_form_notifier.dart';

class TodoAddBottomSheet extends HookConsumerWidget with PageMixin {
  const TodoAddBottomSheet._();

  static Future<void> show({required BuildContext context}) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const TodoAddBottomSheet._(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final todoFormState = ref.watch(todoFormNotifierProvider(null));
    final todoFormNotifier = ref.watch(todoFormNotifierProvider(null).notifier);
    final todoFormValidator = TodoFormValidator(l10n);
    final todoUseCase = ref.watch(todoUseCaseProvider);
    final todoListState = ref
        .watch(todoListStateProvider)
        .whenOrNull(data: (value) => value);

    Future<void> save() async {
      if (formKey.currentState!.validate()) {
        await execute(
          context,
          ref,
          action: () async {
            if (todoListState == null) {
              context.pop();
              throw const AppException();
            }
            await todoUseCase.createTodo(
              todoForm: todoFormState,
              sortOrder: todoListState.length,
            );
          },
          onComplete: () async {
            context.pop();
            AppSnackBar.show(context: context, message: l10n.todoCreateMessage);
          },
          onExceptionCatch: (e) async {
            AppSnackBar.showError(
              context: context,
              message: l10n.unexpectedError,
            );
          },
        );
      }
    }

    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(16),
                  AppTextFormField(
                    initialValue: todoFormState.title,
                    hintText: l10n.todoTitleFormHintText,
                    onChanged: todoFormNotifier.setTitle,
                    validator: todoFormValidator.title,
                  ),
                  AppTextFormField(
                    initialValue: todoFormState.description,
                    hintText: l10n.todoDescriptionFormHintText,
                    icon: const Icon(Icons.edit_note),
                    // MEMO(abe-tk):
                    // ボトムシートが画面領域いっぱいになるとスワイプで閉じれなくなるためmaxLinesを10にしている
                    // SingleChildScrollViewと合わせても閉じれるようにできるはずなので調査対応をしたい。
                    maxLines: 10,
                    onChanged: todoFormNotifier.setDescription,
                  ),
                  const Gap(16),
                  AppDatePickerForm(
                    date: todoFormState.dueDate,
                    setDate: todoFormNotifier.setDueDate,
                    resetDate: todoFormNotifier.resetDueDate,
                  ),
                  ElevatedButton(
                    onPressed: save,
                    child: Text(l10n.saveBtnText),
                  ),
                  const Gap(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
