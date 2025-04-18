import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'presentation/page/todo/todo_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: lightTheme(), home: const TodoListPage());
  }
}
