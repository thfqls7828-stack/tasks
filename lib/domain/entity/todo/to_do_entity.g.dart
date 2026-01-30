// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToDoEntity _$ToDoEntityFromJson(Map<String, dynamic> json) => _ToDoEntity(
  id: json['id'] as String,
  title: json['title'] as String,
  des: json['des'] as String?,
  isFavorite: json['is_favorite'] as bool,
  isDone: json['is_done'] as bool,
);

Map<String, dynamic> _$ToDoEntityToJson(_ToDoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'des': instance.des,
      'is_favorite': instance.isFavorite,
      'is_done': instance.isDone,
    };