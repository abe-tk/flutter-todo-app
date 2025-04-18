import 'package:flutter/material.dart';

import '../../../../feature/todo/domain/entity/todo_entity.dart';
import '../../../../util/formatter/date_time_formatter.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todoListItem});

  final TodoEntity todoListItem;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      title: Text(todoListItem.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (todoListItem.description != null)
            Text(
              todoListItem.description!,
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          if (todoListItem.dueDate != null)
            Text(
              todoListItem.dueDate!.MMMEd(),
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
        ],
      ),
      leading: Checkbox(
        value: todoListItem.isCompleted,
        onChanged: (value) {
          // TODO(takuro): タスク完了処理
        },
      ),
      onTap: () {
        // TODO(takuro): タスク編集画面への遷移
      },
    );
  }
}
