import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/core/di/repository/todo_repository_di.dart';
import 'package:flutter_basic_assignment/data/DTO/todo_dto.dart';
import 'package:flutter_basic_assignment/data/data_source/todo_data_source.dart';
import 'package:flutter_basic_assignment/domain/entity/todo/todo_entity.dart';
import 'package:flutter_basic_assignment/domain/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository_impl.g.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoDataSource todoDataSource;

  TodoRepositoryImpl({required this.todoDataSource});

  @override
  Future<void> addTodo(ToDoEntity todo) async {
    final todoDto = TodoDto(
      id: todo.id,
      title: todo.title,
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
      isFavorite: todo.isFavorite,
      isDone: todo.isDone,
    );

    await todoDataSource.deleteTodo(todoDto);
  }

  @override
  Future<List<ToDoEntity>> getTodos() async {
    final todoDtoList = await todoDataSource.getTodos();
    return todoDtoList
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
