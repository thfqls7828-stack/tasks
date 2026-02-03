import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/domain/entity/todo/todo_entity.dart';
import 'package:flutter_basic_assignment/domain/entity/todo_last_doc/todo_last_doc.dart';

abstract class TodoRepository {
  // Todo 추가
  Future<void> addTodo(ToDoEntity todo);

  // Todo 내용 업데이트
  Future<void> updateTodo(ToDoEntity todo);

  // Todo 삭제
  Future<void> deleteTodo(ToDoEntity todo);

  // 전체 Todo 목록 불러오기
  Future<TodoLastDoc> getTodos(DocumentSnapshot? lastDoc);
}
