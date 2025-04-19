import 'package:flutter/material.dart';

import '../../../../feature/todo/domain/entity/todo_entity.dart';
import '../../../../routing/go_router.dart';
import '../../../../util/formatter/date_time_formatter.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo});

  final TodoEntity todo;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      title: Text(todo.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (todo.description != null)
            Text(
              todo.description!,
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          if (todo.dueDate != null)
            Text(
              todo.dueDate!.MMMEd(),
              style: textTheme.bodyMedium!.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
        ],
      ),
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (value) {
          // TODO(takuro): タスク完了処理
        },
      ),
      onTap: () {
        TodoEditPageRoute($extra: todo).go(context);
      },
    );
  }
}
