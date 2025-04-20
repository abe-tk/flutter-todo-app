import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../presentation/page/todo/notifier/todo_sort_type_notifier.dart';
import '../../domain/entity/todo_entity.dart';
import '../usecase/todo_usecase.dart';

part 'todo_list_state.g.dart';

@riverpod
Stream<List<TodoEntity>> todoListState(Ref ref) {
  final useCase = ref.watch(todoUseCaseProvider);
  final sortType = ref.watch(todoSortTypeNotifierProvider);
  return useCase.realTimeFetchTodoList(sortType: sortType);
}
