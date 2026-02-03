import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/data/dto/todo/todo_dto.dart';
import 'package:flutter_basic_assignment/domain/entity/todo/todo_entity.dart';

class TodoLastDocDto {
  final List<TodoDto> todos;
  final DocumentSnapshot? lastDoc;

  TodoLastDocDto({required this.todos, required this.lastDoc});

  TodoLastDocDto copyWith({List<TodoDto>? todos, DocumentSnapshot? lastDoc}) {
    return TodoLastDocDto(
      todos: todos ?? this.todos,
      lastDoc: lastDoc ?? this.lastDoc,
    );
  }

  factory TodoLastDocDto.fromJson(Map<String, dynamic> json) {
    return TodoLastDocDto(
      todos: json['todos'].map((e) => TodoDto.fromJson(e)).toList(),
      lastDoc: json['last_doc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todos': todos.map((e) => e.toJson()).toList(),
      'last_doc': lastDoc,
    };
  }

  static List<ToDoEntity> toEntity(TodoLastDocDto todoLastDocDto) {
    return todoLastDocDto.todos
        .map(
          (todoDto) => ToDoEntity(
            id: todoDto.id,
            title: todoDto.title,
            des: todoDto.des,
            isFavorite: todoDto.isFavorite,
            isDone: todoDto.isDone,
          ),
        )
        .toList();
  }
}
