import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../feature/todo/domain/entity/todo_entity.dart';
import 'model/todo_form_model.dart';

part 'todo_form_notifier.g.dart';

@riverpod
class TodoFormNotifier extends _$TodoFormNotifier {
  @override
  TodoFormModel build(TodoEntity? todo) {
    if (todo != null) {
      return TodoFormModel(
        title: todo.title,
        description: todo.description,
        dueDate: todo.dueDate,
      );
    }
    return const TodoFormModel();
  }

  void setTitle(String? title) {
    state = state.copyWith(title: title);
  }

  void setDescription(String? description) {
    state = state.copyWith(description: description);
  }

  void setDueDate(DateTime? dueDate) {
    state = state.copyWith(dueDate: dueDate);
  }

  void resetDueDate() {
    state = state.copyWith(dueDate: null);
  }
}
