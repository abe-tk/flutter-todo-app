import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../enum/todo_sort_type.dart';
import '../../../../presentation/page/todo/notifier/model/todo_form_model.dart';
import '../../domain/entity/todo_entity.dart';
import '../../infra/todo_repository.dart';

part 'todo_usecase.g.dart';

@riverpod
TodoUseCase todoUseCase(Ref ref) {
  return TodoUseCase(
    repository: TodoRepository(
      firestore: FirebaseFirestore.instance,
      // TODO(takuro): 認証機能実装後、providerで管理する認証情報を用いてuserIdを指定する
      userId: 'b9WIpJvz4xnGFTi0NTR9',
    ),
  );
}

class TodoUseCase {
  TodoUseCase({required this.repository});

  final TodoRepository repository;

  Stream<List<TodoEntity>> realTimeFetchTodoList({
    required TodoSortType sortType,
  }) {
    return repository.realTimeFetchTodoList(sortType: sortType);
  }

  Future<void> updateSortOrder({required List<TodoEntity> todoList}) async {
    await repository.updateSortOrder(todoList: todoList);
  }

  Future<void> updateTodo({
    required TodoEntity todo,
    required TodoFormModel todoForm,
  }) async {
    await repository.updateTodo(todo: todo, todoForm: todoForm);
  }

  Future<void> updateIsCompleted({
    required TodoEntity todo,
    required bool isCompleted,
  }) async {
    await repository.updateIsCompleted(todo: todo, isCompleted: isCompleted);
  }

  Future<void> deleteTodo({required TodoEntity todo}) async {
    await repository.deleteTodo(todo: todo);
  }
}
