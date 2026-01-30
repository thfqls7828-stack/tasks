import 'package:flutter_basic_assignment/data/DTO/todo_dto.dart';

abstract class TodoDataSource {
  Future<void> addTodo(TodoDto todo);

  Future<void> deleteTodo(TodoDto todo);

  Future<List<TodoDto>> getTodos();

  Future<void> updateTodo(TodoDto todo);
}
