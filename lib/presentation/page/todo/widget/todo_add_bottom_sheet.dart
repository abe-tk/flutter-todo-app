import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../l10n/l10n.dart';
import '../../../../util/validator/todo_form_validator.dart';
import '../../../common_widget/app_date_time_picker.dart';
import '../../../common_widget/app_text_form_field.dart';
import '../notifier/todo_form_notifier.dart';

class TodoAddBottomSheet extends HookConsumerWidget {
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

    void save() {
      if (formKey.currentState!.validate()) {
        // TODO(takuro): 保存処理
        context.pop();
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
                    maxLines: 10,
                    onChanged: todoFormNotifier.setDescription,
                  ),
                  const Gap(16),
                  AppDatePickerForm(
                    date: todoFormState.dueDate,
                    setDate: todoFormNotifier.setDueDate,
                    resetDate: todoFormNotifier.resetDueDate,
                  ),
                  ElevatedButton(onPressed: save, child: Text(l10n.saveBtnText)),
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
