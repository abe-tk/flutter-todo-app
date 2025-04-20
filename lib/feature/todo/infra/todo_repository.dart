import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../enum/todo_sort_type.dart';
import '../../../presentation/page/todo/notifier/model/todo_form_model.dart';
import '../../../util/exception/app_exception.dart';
import '../../../util/extension/text_sanitizer.dart';
import '../domain/entity/todo_entity.dart';

class TodoRepository {
  TodoRepository({required FirebaseFirestore firestore, required String userId})
    : _firestore = firestore,
      _userId = userId;

  final FirebaseFirestore _firestore;
  final String _userId;

  CollectionReference<Map<String, dynamic>> get _todoCollection {
    return _firestore.collection('users').doc(_userId).collection('todos');
  }

  /// `Todo`の一覧をリアルタイムで取得する
  Stream<List<TodoEntity>> realTimeFetchTodoList({
    required TodoSortType sortType,
  }) {
    try {
      final snapshots = _todoCollection.snapshots();
      final todoListStream = snapshots.map((snapshot) {
        final docs = snapshot.docs;
        final todoList =
            docs.map((doc) {
              final data = doc.data();
              return TodoEntity.fromJson({...data, 'id': doc.id});
            }).toList();
        return _sortTodoList(list: todoList, sortType: sortType);
      });
      return todoListStream;
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }

  /// 取得したTodoの並び順を調整する
  List<TodoEntity> _sortTodoList({
    required List<TodoEntity> list,
    required TodoSortType sortType,
  }) {
    final sorted = [...list];

    switch (sortType) {
      // sortOrder（手動で設定された並び順）でソート
      case TodoSortType.specifiedOrder:
        sorted.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

      // 期限日（dueDate）が新しい順にソート
      case TodoSortType.dueDate:
        sorted.sort((a, b) {
          final aDue = a.dueDate;
          final bDue = b.dueDate;

          if (aDue != null && bDue != null) {
            // 両方の期限がある場合は、新しい順（降順）に並べる
            return bDue.compareTo(aDue);
          } else if (aDue == null && bDue == null) {
            // 両方期限がない場合は、作成日時（createdAt）が新しい順に並べる
            return b.createdAt.compareTo(a.createdAt);
          } else if (aDue == null) {
            // a の期限がない → b を前に持ってくる
            return 1;
          } else {
            // b の期限がない → b を後ろに持ってくる
            return -1;
          }
        });
    }
    return sorted;
  }

  /// `Todo`の並び順を更新する
  Future<void> updateSortOrder({required List<TodoEntity> todoList}) async {
    try {
      final batch = _firestore.batch();
      for (var i = 0; i < todoList.length; i++) {
        final todo = todoList[i];
        batch.update(_todoCollection.doc(todo.id), {'sortOrder': i});
      }
      await batch.commit();
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }

  /// `Todo`の更新
  Future<void> updateTodo({
    required TodoEntity todo,
    required TodoFormModel todoForm,
  }) async {
    try {
      await _todoCollection.doc(todo.id).update({
        'title': todoForm.title.sanitizeRequired(),
        'description': todoForm.description.sanitizeOptional(),
        'dueDate': todoForm.dueDate,
      });
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }

  /// `Todo`の完了・未完了の更新
  Future<void> updateIsCompleted({
    required TodoEntity todo,
    required bool isCompleted,
  }) async {
    try {
      await _todoCollection.doc(todo.id).update({'isCompleted': isCompleted});
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }

  /// `Todo`の削除
  Future<void> deleteTodo({required TodoEntity todo}) async {
    try {
      await _todoCollection.doc(todo.id).delete();
    } on Exception catch (e) {
      throw AppException(message: e.toString());
    }
  }
}
