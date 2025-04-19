import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feature/todo/domain/entity/todo_entity.dart';
import '../presentation/page/todo/todo_edit_page.dart';
import '../presentation/page/todo/todo_list_page.dart';

part 'go_router.g.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: $appRoutes);
});

@TypedGoRoute<TodoListPageRoute>(
  path: TodoListPage.path,
  name: TodoListPage.name,
  routes: [
    TypedGoRoute<TodoEditPageRoute>(
      path: TodoEditPage.path,
      name: TodoEditPage.name,
    ),
  ],
)
class TodoListPageRoute extends GoRouteData {
  const TodoListPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TodoListPage();
  }
}

class TodoEditPageRoute extends GoRouteData {
  const TodoEditPageRoute({required this.$extra});

  final TodoEntity $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TodoEditPage(todo: $extra);
  }
}
