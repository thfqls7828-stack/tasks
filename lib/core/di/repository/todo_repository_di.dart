import 'package:flutter_basic_assignment/core/di/data_source/todo_data_source_di.dart';
import 'package:flutter_basic_assignment/data/repository_impl/todo_repository_impl.dart';
import 'package:flutter_basic_assignment/domain/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository_di.g.dart';

@riverpod
TodoRepository todoRepository(Ref ref) {
  return TodoRepositoryImpl(todoDataSource: ref.watch(todoDataSourceProvider));
}
