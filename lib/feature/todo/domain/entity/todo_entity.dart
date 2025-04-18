import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@freezed
abstract class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    required String id,
    required String title,
    String? description,
    required bool isCompleted,
    DateTime? dueDate,
    required int sortOrder,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TodoEntity;

  factory TodoEntity.fromJson(Map<String, Object?> json) =>
      _$TodoEntityFromJson(json);
}
