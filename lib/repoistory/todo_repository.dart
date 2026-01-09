import 'package:flutter_basic_assignment/entity/to_do_entity.dart';

abstract class TodoRepository {
  Future<void> addTodo(ToDoEntity todo);
  Future<void> updateTodo(ToDoEntity todo);
  Future<void> deleteTodo(ToDoEntity todo);
  Future<List<ToDoEntity>> getTodos();
}
