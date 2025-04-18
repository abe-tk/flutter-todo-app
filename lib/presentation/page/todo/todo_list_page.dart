import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../feature/todo/domain/entity/todo_entity.dart';
import 'widget/todo_list_item.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text('並べ替え'),
                ),
                ListTile(
                  leading: const Icon(Icons.check),
                  title: const Text('指定した順序'),
                  onTap: () {
                    // TODO(takuro): ソート処理
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.check),
                  title: const Text('期限日'),
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
        title: const Text('Flutter Todo App'),
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
            child: TodoListItem(todoListItem: todoList[index]),
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
        onPressed: () {
          // TODO(takuro): タスク追加処理
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
