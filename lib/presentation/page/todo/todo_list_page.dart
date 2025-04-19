import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../feature/todo/domain/entity/todo_entity.dart';
import '../../../l10n/l10n.dart';
import 'widget/todo_add_bottom_sheet.dart';
import 'widget/todo_list_item.dart';

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

    Future<void> showSortBottomSheet() async {
      await showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(24),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(l10n.sortButtomSheetTitle),
                ),
                ListTile(
                  leading: const Icon(Icons.check),
                  title: Text(l10n.sortButtomSheetItemSpecifiedOorder),
                  onTap: () {
                    // TODO(takuro): ソート処理
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.check),
                  title: Text(l10n.sortButtomSheetItemDueDate),
                  onTap: () {
                    // TODO(takuro): ソート処理
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.todoListPageAppBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: showSortBottomSheet,
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
