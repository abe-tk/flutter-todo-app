import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../enum/todo_sort_type.dart';
import '../../../../gen/i18n/app_localizations.dart';
import '../notifier/todo_sort_type_notifier.dart';

class TodoSortBottomSheet extends ConsumerWidget {
  const TodoSortBottomSheet._();

  static Future<void> show({required BuildContext context}) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const TodoSortBottomSheet._(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(24),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(l10n.sortBottomSheetTitle),
          ),
          _ListItem(
            sortType: TodoSortType.specifiedOrder,
            title: l10n.sortBottomSheetItemSpecifiedOrder,
          ),
          _ListItem(
            sortType: TodoSortType.dueDate,
            title: l10n.sortBottomSheetItemDueDate,
          ),
          const Gap(24),
        ],
      ),
    );
  }
}

class _ListItem extends ConsumerWidget {
  const _ListItem({required this.sortType, required this.title});

  final TodoSortType sortType;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoSortTypeState = ref.watch(todoSortTypeNotifierProvider);
    final todoSortTypeNotifier = ref.watch(
      todoSortTypeNotifierProvider.notifier,
    );
    return ListTile(
      leading: Icon(
        Icons.check,
        color: todoSortTypeState == sortType ? null : Colors.transparent,
      ),
      title: Text(title),
      onTap: () {
        todoSortTypeNotifier.setSortType(sortType);
        context.pop();
      },
    );
  }
}
