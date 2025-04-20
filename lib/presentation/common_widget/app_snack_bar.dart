import 'package:flutter/material.dart';

class AppSnackBar extends StatelessWidget {
  const AppSnackBar._({required this.message});

  final String message;

  static void show({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showError({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Theme.of(context).colorScheme.error,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
