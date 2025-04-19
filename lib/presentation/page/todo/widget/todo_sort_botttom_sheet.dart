import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../l10n/l10n.dart';

class TodoSortBottomSheet extends HookConsumerWidget {
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
    final l10n = L10n.of(context);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          const Gap(24),
        ],
      ),
    );
  }
}
