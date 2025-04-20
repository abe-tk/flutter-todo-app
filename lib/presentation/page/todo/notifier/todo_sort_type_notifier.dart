import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../enum/todo_sort_type.dart';

part 'todo_sort_type_notifier.g.dart';

@riverpod
class TodoSortTypeNotifier extends _$TodoSortTypeNotifier {
  @override
  TodoSortType build() {
    return TodoSortType.specifiedOrder;
  }

  // ignore: use_setters_to_change_properties
  void setSortType(TodoSortType sortType) {
    state = sortType;
  }
}
