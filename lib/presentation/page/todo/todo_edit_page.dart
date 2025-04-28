import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../feature/todo/application/usecase/todo_usecase.dart';
import '../../../feature/todo/domain/entity/todo_entity.dart';
import '../../../gen/i18n/app_localizations.dart';
import '../../../util/validator/todo_form_validator.dart';
import '../../common_widget/app_date_time_picker.dart';
import '../../common_widget/app_snack_bar.dart';
import '../../common_widget/app_text_form_field.dart';
import '../../mixin/page_mixin.dart';
import 'notifier/todo_form_notifier.dart';

class TodoEditPage extends HookConsumerWidget with PageMixin {
  const TodoEditPage({super.key, required this.todo});

  final TodoEntity todo;

  static const name = 'todo_edit';
  static const path = 'todo_edit';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final todoFormState = ref.watch(todoFormNotifierProvider(todo));
    final todoFormNotifier = ref.watch(todoFormNotifierProvider(todo).notifier);
    final todoFormValidator = TodoFormValidator(l10n);
    final todoUseCase = ref.watch(todoUseCaseProvider);

    Future<void> delete() async {
      await execute(
        context,
        ref,
        action: () async {
          await todoUseCase.deleteTodo(todo: todo);
        },
        onComplete: () async {
          context.pop();
          AppSnackBar.show(context: context, message: l10n.todoDeleteMessage);
        },
        onExceptionCatch: (e) async {
          AppSnackBar.showError(
            context: context,
            message: l10n.unexpectedError,
          );
        },
      );
    }

    Future<void> save() async {
      if (formKey.currentState!.validate()) {
        await execute(
          context,
          ref,
          action: () async {
            await todoUseCase.updateTodo(todo: todo, todoForm: todoFormState);
          },
          onComplete: () async {
            context.pop();
            AppSnackBar.show(context: context, message: l10n.todoUpdateMessage);
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

    Future<void> updateIsCompleted() async {
      await execute(
        context,
        ref,
        action: () async {
          await todoUseCase.updateIsCompleted(
            todo: todo,
            isCompleted: !todo.isCompleted,
          );
        },
        onComplete: () async {
          context.pop();
          AppSnackBar.show(
            context: context,
            message:
                !todo.isCompleted
                    ? l10n.todoCompleteMessage
                    : l10n.todoIncompleteMessage,
          );
        },
        onExceptionCatch: (e) async {
          AppSnackBar.showError(
            context: context,
            message: l10n.unexpectedError,
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: delete,
            icon: Icon(Icons.delete, color: colorScheme.error),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
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
                      maxLines: 99,
                      onChanged: todoFormNotifier.setDescription,
                    ),
                    const Gap(16),
                    AppDatePickerForm(
                      date: todoFormState.dueDate,
                      setDate: todoFormNotifier.setDueDate,
                      resetDate: todoFormNotifier.resetDueDate,
                    ),
                    const Gap(40),
                    ElevatedButton(
                      onPressed: save,
                      child: Text(l10n.saveBtnText),
                    ),
                    const Gap(100),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 80,
              color: colorScheme.secondaryContainer,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: TextButton(
                    onPressed: updateIsCompleted,
                    child: Text(
                      todo.isCompleted
                          ? l10n.incompleteBtnText
                          : l10n.completeBtnText,
                      style: textTheme.labelLarge!.copyWith(
                        color: colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
