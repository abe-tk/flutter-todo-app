import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../enum/todo_sort_type.dart';
import '../../../feature/auth/application/usecase/auth_usecase.dart';
import '../../../feature/todo/application/state/todo_list_state.dart';
import '../../../feature/todo/application/usecase/todo_usecase.dart';
import '../../../feature/todo/domain/entity/todo_entity.dart';
import '../../../gen/i18n/app_localizations.dart';
import '../../common_widget/app_snack_bar.dart';
import '../../mixin/page_mixin.dart';
import 'notifier/todo_sort_type_notifier.dart';
import 'widget/todo_add_bottom_sheet.dart';
import 'widget/todo_list_item.dart';
import 'widget/todo_sort_bottom_sheet.dart';

class TodoListPage extends ConsumerWidget with PageMixin {
  const TodoListPage({super.key});

  static const name = 'todo_list';
  static const path = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final todoListState = ref.watch(todoListStateProvider);
    final todoSortTypeState = ref.watch(todoSortTypeNotifierProvider);
    final todoUseCase = ref.watch(todoUseCaseProvider);
    final authUseCase = ref.watch(authUseCaseProvider);

    Future<void> updateSortOrder({required List<TodoEntity> todoList}) async {
      await execute(
        context,
        ref,
        showLoading: false,
        action: () async {
          await todoUseCase.updateSortOrder(todoList: todoList);
        },
        onExceptionCatch: (e) async {
          AppSnackBar.showError(
            context: context,
            message: l10n.unexpectedError,
          );
        },
      );
    }

    Future<void> signOut() async {
      await authUseCase.signOut();
    }

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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(l10n.signOut),
              onTap: signOut,
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(todoListStateProvider);
        },
        child: todoListState.when(
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          error: (_, _) {
            return ListView(
              children: [
                const Gap(40),
                Text(l10n.unexpectedError, textAlign: TextAlign.center),
              ],
            );
          },
          data: (todoList) {
            if (todoList.isEmpty) {
              return ListView(
                children: [
                  const Gap(40),
                  Text(l10n.todoNotRegistered, textAlign: TextAlign.center),
                ],
              );
            }
            return ReorderableListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Material(
                  key: Key('$index'),
                  child: TodoListItem(todo: todoList[index]),
                );
              },
              onReorder: (oldIndex, newIndex) async {
                if (todoSortTypeState != TodoSortType.specifiedOrder) {
                  AppSnackBar.show(
                    context: context,
                    message: l10n.sortOrderRequiredMessage,
                  );
                  return;
                }

                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = todoList.removeAt(oldIndex);
                todoList.insert(newIndex, item);

                await updateSortOrder(todoList: todoList);
              },
              footer: const Gap(80),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => TodoAddBottomSheet.show(context: context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
