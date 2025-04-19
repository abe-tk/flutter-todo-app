// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoFormModel {

 String? get title; String? get description; DateTime? get dueDate;
/// Create a copy of TodoFormModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoFormModelCopyWith<TodoFormModel> get copyWith => _$TodoFormModelCopyWithImpl<TodoFormModel>(this as TodoFormModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoFormModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,dueDate);

@override
String toString() {
  return 'TodoFormModel(title: $title, description: $description, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class $TodoFormModelCopyWith<$Res>  {
  factory $TodoFormModelCopyWith(TodoFormModel value, $Res Function(TodoFormModel) _then) = _$TodoFormModelCopyWithImpl;
@useResult
$Res call({
 String? title, String? description, DateTime? dueDate
});




}
/// @nodoc
class _$TodoFormModelCopyWithImpl<$Res>
    implements $TodoFormModelCopyWith<$Res> {
  _$TodoFormModelCopyWithImpl(this._self, this._then);

  final TodoFormModel _self;
  final $Res Function(TodoFormModel) _then;

/// Create a copy of TodoFormModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? description = freezed,Object? dueDate = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc


class _TodoFormModel implements TodoFormModel {
  const _TodoFormModel({this.title, this.description, this.dueDate});
  

@override final  String? title;
@override final  String? description;
@override final  DateTime? dueDate;

/// Create a copy of TodoFormModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoFormModelCopyWith<_TodoFormModel> get copyWith => __$TodoFormModelCopyWithImpl<_TodoFormModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoFormModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,dueDate);

@override
String toString() {
  return 'TodoFormModel(title: $title, description: $description, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$TodoFormModelCopyWith<$Res> implements $TodoFormModelCopyWith<$Res> {
  factory _$TodoFormModelCopyWith(_TodoFormModel value, $Res Function(_TodoFormModel) _then) = __$TodoFormModelCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? description, DateTime? dueDate
});




}
/// @nodoc
class __$TodoFormModelCopyWithImpl<$Res>
    implements _$TodoFormModelCopyWith<$Res> {
  __$TodoFormModelCopyWithImpl(this._self, this._then);

  final _TodoFormModel _self;
  final $Res Function(_TodoFormModel) _then;

/// Create a copy of TodoFormModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? dueDate = freezed,}) {
  return _then(_TodoFormModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
