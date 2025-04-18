import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../feature/todo/domain/entity/todo_entity.dart';

class TodoEditPage extends HookConsumerWidget {
  const TodoEditPage({super.key, required this.todo});

  final TodoEntity todo;

  static const name = 'todo_edit';
  static const path = 'todo_edit';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextFormField(
                  initialValue: todo.title,
                  decoration: const InputDecoration(hintText: 'タイトルを入力'),
                ),
                TextFormField(
                  initialValue: todo.description,
                  decoration: const InputDecoration(
                    hintText: '詳細を追加',
                    icon: Icon(Icons.edit_note),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
