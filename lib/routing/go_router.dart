import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feature/auth/application/state/auth_state.dart';
import '../feature/todo/domain/entity/todo_entity.dart';
import '../presentation/page/auth/sign_in_page.dart';
import '../presentation/page/auth/sign_up_page.dart';
import '../presentation/page/todo/todo_edit_page.dart';
import '../presentation/page/todo/todo_list_page.dart';

part 'go_router.g.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  return GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      if (authState.isLoading || authState.hasError) {
        return null;
      }

      final isLoggedIn = authState.value != null;
      final topRouteName = state.topRoute?.name;

      // 未ログインでアクセスできるページ一覧
      const allowedForGuestPages = [SignInPage.name, SignUpPage.name];

      if (!isLoggedIn && !allowedForGuestPages.contains(topRouteName)) {
        // 未ログインで許可されてないページにいたら、サインインへ
        return SignInPage.path;
      }

      if (isLoggedIn && topRouteName == SignInPage.name) {
        // ログイン済みでサインインページにいるなら、Todoリストへ
        return TodoListPage.path;
      }

      return null;
    },
  );
});

@TypedGoRoute<SignInPageRoute>(
  path: SignInPage.path,
  name: SignInPage.name,
  routes: [
    TypedGoRoute<SignUpPageRoute>(path: SignUpPage.path, name: SignUpPage.name),
  ],
)
class SignInPageRoute extends GoRouteData {
  const SignInPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}

class SignUpPageRoute extends GoRouteData {
  const SignUpPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}

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
