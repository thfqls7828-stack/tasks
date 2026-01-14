import 'package:flutter_basic_assignment/entity/todo/to_do_entity.dart';

// part 'todo_repository.g.dart';

abstract class TodoRepository {
  Future<void> addTodo(ToDoEntity todo);
  Future<void> updateTodo(ToDoEntity todo);
  Future<void> deleteTodo(ToDoEntity todo);
  Future<List<ToDoEntity>> getTodos();
}
