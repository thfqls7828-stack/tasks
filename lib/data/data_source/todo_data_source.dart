import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/data/dto/todo/todo_dto.dart';
import 'package:flutter_basic_assignment/data/dto/todo_last_doc/todo_last_doc.dart';

abstract class TodoDataSource {
  Future<void> addTodo(TodoDto todo);

  Future<void> deleteTodo(TodoDto todo);

  Future<TodoLastDocDto> getTodos(DocumentSnapshot? lastDoc);

  Future<void> updateTodo(TodoDto todo);
}
