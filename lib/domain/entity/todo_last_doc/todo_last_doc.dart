import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/domain/entity/todo/todo_entity.dart';

class TodoLastDoc {
  final List<ToDoEntity> todos;
  final DocumentSnapshot? lastDoc;

  TodoLastDoc({required this.todos, required this.lastDoc});

  TodoLastDoc copyWith({List<ToDoEntity>? todos, DocumentSnapshot? lastDoc}) {
    return TodoLastDoc(
      todos: todos ?? this.todos,
      lastDoc: lastDoc ?? this.lastDoc,
    );
  }

  factory TodoLastDoc.fromJson(Map<String, dynamic> json) {
    return TodoLastDoc(
      todos: json['todos'].map((e) => ToDoEntity.fromJson(e)).toList(),
      lastDoc: json['last_doc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todos': todos.map((e) => e.toJson()).toList(),
      'last_doc': lastDoc,
    };
  }
}
