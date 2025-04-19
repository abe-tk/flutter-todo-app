import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../feature/todo/domain/entity/todo_entity.dart';
import '../../../l10n/l10n.dart';
import 'widget/todo_add_bottom_sheet.dart';
import 'widget/todo_list_item.dart';
import 'widget/todo_sort_botttom_sheet.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  static const name = 'todo_list';
  static const path = '/';

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    // TODO(takuro): firestoreから取得するデータに置き換える
    final todoList = List.generate(10, (int index) {
      return TodoEntity(
        id: index.toString(),
        title: 'タスク$index',
        description: 'これはタスクの詳細です。これはタスクの詳細です。これはタスクの詳細です。これはタスクの詳細です。',
        isCompleted: false,
        dueDate: DateTime(2025, 4, index + 10),
        sortOrder: index,
        createdAt: DateTime(2025, 4, index),
        updatedAt: DateTime(2025, 4, index),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.todoListPageAppBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () => TodoSortBottomSheet.show(context: context),
          ),
        ],
      ),
      body: ReorderableListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Material(
            key: Key('$index'),
            child: TodoListItem(todo: todoList[index]),
          );
        },
        onReorder: (int oldIndex, int newIndex) {
          // TODO(takuro): 並べ替え処理
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = todoList.removeAt(oldIndex);
          todoList.insert(newIndex, item);
        },
        footer: const Gap(80),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => TodoAddBottomSheet.show(context: context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
