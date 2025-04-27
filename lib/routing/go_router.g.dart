// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$signInPageRoute, $todoListPageRoute];

RouteBase get $signInPageRoute => GoRouteData.$route(
  path: '/sign_in',
  name: 'sign_in',

  factory: $SignInPageRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: 'sign_up',
      name: 'sign_up',

      factory: $SignUpPageRouteExtension._fromState,
    ),
  ],
);

extension $SignInPageRouteExtension on SignInPageRoute {
  static SignInPageRoute _fromState(GoRouterState state) =>
      const SignInPageRoute();

  String get location => GoRouteData.$location('/sign_in');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SignUpPageRouteExtension on SignUpPageRoute {
  static SignUpPageRoute _fromState(GoRouterState state) =>
      const SignUpPageRoute();

  String get location => GoRouteData.$location('/sign_in/sign_up');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $todoListPageRoute => GoRouteData.$route(
  path: '/',
  name: 'todo_list',

  factory: $TodoListPageRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: 'todo_edit',
      name: 'todo_edit',

      factory: $TodoEditPageRouteExtension._fromState,
    ),
  ],
);

extension $TodoListPageRouteExtension on TodoListPageRoute {
  static TodoListPageRoute _fromState(GoRouterState state) =>
      const TodoListPageRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TodoEditPageRouteExtension on TodoEditPageRoute {
  static TodoEditPageRoute _fromState(GoRouterState state) =>
      TodoEditPageRoute($extra: state.extra as TodoEntity);

  String get location => GoRouteData.$location('/todo_edit');

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
