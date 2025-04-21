import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../util/converter/timestamp_converter.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@freezed
abstract class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String id,
    required String title,
    String? description,
    required bool isCompleted,
    @TimestampConverter() DateTime? dueDate,
    required int sortOrder,
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,
  }) = _TodoEntity;

  factory TodoEntity.fromJson(Map<String, Object?> json) =>
      _$TodoEntityFromJson(json);
}
