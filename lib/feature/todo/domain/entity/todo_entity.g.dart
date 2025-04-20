// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoEntity _$TodoEntityFromJson(Map<String, dynamic> json) => _TodoEntity(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  isCompleted: json['isCompleted'] as bool,
  dueDate: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['dueDate'],
    const TimestampConverter().fromJson,
  ),
  sortOrder: (json['sortOrder'] as num).toInt(),
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  updatedAt: const TimestampConverter().fromJson(
    json['updatedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$TodoEntityToJson(_TodoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'dueDate': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.dueDate,
        const TimestampConverter().toJson,
      ),
      'sortOrder': instance.sortOrder,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
