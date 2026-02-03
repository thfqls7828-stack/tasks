import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/data/data_source/todo_data_source.dart';
import 'package:flutter_basic_assignment/data/dto/todo/todo_dto.dart';
import 'package:flutter_basic_assignment/data/dto/todo_last_doc/todo_last_doc.dart';
import 'package:flutter_basic_assignment/domain/entity/todo/todo_entity.dart';
import 'package:flutter_basic_assignment/domain/entity/todo_last_doc/todo_last_doc.dart';
import 'package:flutter_basic_assignment/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoDataSource todoDataSource;

  TodoRepositoryImpl({required this.todoDataSource});

  @override
  Future<void> addTodo(ToDoEntity todo) async {
    final todoDto = TodoDto(
      id: todo.id,
      title: todo.title,
      des: todo.des,
      isFavorite: todo.isFavorite,
      isDone: todo.isDone,
    );

    await todoDataSource.addTodo(todoDto);
  }

  @override
  Future<void> deleteTodo(ToDoEntity todo) async {
    final todoDto = TodoDto(
      id: todo.id,
      title: todo.title,
      des: todo.des,
      isFavorite: todo.isFavorite,
      isDone: todo.isDone,
    );

    await todoDataSource.deleteTodo(todoDto);
  }

  @override
  Future<TodoLastDoc> getTodos(DocumentSnapshot? lastDoc) async {
    final todoDtoList = await todoDataSource.getTodos(lastDoc);
    final todos = todoDtoList.todos
        .map(
          (todo) => ToDoEntity(
            id: todo.id,
            title: todo.title,
            des: todo.des,
            isFavorite: todo.isFavorite,
            isDone: todo.isDone,
          ),
        )
        .toList();
    return TodoLastDoc(todos: todos, lastDoc: todoDtoList.lastDoc);
  }

  @override
  Future<void> updateTodo(ToDoEntity todo) async {
    final todoDto = TodoDto(
      id: todo.id,
      title: todo.title,
      des: todo.des,
      isFavorite: todo.isFavorite,
      isDone: todo.isDone,
    );

    await todoDataSource.updateTodo(todoDto);
  }
}
