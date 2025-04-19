import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_form_model.freezed.dart';

@freezed
abstract class TodoFormModel with _$TodoFormModel {
  const factory TodoFormModel({
    String? title,
    String? description,
    DateTime? dueDate,
  }) = _TodoFormModel;
}
