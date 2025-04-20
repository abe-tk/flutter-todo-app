import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../feature/todo/application/usecase/todo_usecase.dart';
import '../../../../feature/todo/domain/entity/todo_entity.dart';
import '../../../../l10n/l10n.dart';
import '../../../../routing/go_router.dart';
import '../../../../util/formatter/date_time_formatter.dart';
import '../../../common_widget/app_snack_bar.dart';
import '../../../mixin/page_mixin.dart';

class TodoListItem extends ConsumerWidget with PageMixin {
  const TodoListItem({super.key, required this.todo});

  final TodoEntity todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final todoUseCase = ref.watch(todoUseCaseProvider);

    Future<void> updateIsCompleted({required bool isCompleted}) async {
      await execute(
        context,
        ref,
        showLoading: false,
        action: () async {
          await todoUseCase.updateIsCompleted(
            todo: todo,
            isCompleted: isCompleted,
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
          if (value != null) {
            updateIsCompleted(isCompleted: value);
          }
        },
      ),
      onTap: () {
        TodoEditPageRoute($extra: todo).go(context);
      },
    );
  }
}
