import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../feature/todo/domain/entity/todo_entity.dart';
import '../../common_widget/app_date_time_picker.dart';
import '../../common_widget/app_text_form_field.dart';
import 'notifier/todo_form_notifier.dart';

class TodoEditPage extends HookConsumerWidget {
  const TodoEditPage({super.key, required this.todo});

  final TodoEntity todo;

  static const name = 'todo_edit';
  static const path = 'todo_edit';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final todoFormState = ref.watch(todoFormNotifierProvider(todo));
    final todoFormNotifier = ref.watch(todoFormNotifierProvider(todo).notifier);

    void delete() {
      // TODO(takuro): 削除処理
      context.pop();
    }

    void save() {
      if (formKey.currentState!.validate()) {
        // TODO(takuro): 保存処理
        context.pop();
      }
    }

    void complete() {
      // TODO(takuro): タスク完了処理
      context.pop();
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
                      hintText: 'タイトルを入力',
                      onChanged: todoFormNotifier.setTitle,
                      validator: (value) {
                        if (value == '') {
                          return '入力してください';
                        }
                        return null;
                      },
                    ),
                    AppTextFormField(
                      initialValue: todoFormState.description,
                      hintText: '詳細を追加',
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
                    ElevatedButton(onPressed: save, child: const Text('保存する')),
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
                    onPressed: complete,
                    child: Text(
                      '完了とする',
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
