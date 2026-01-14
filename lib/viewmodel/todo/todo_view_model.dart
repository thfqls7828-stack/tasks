import 'package:flutter_basic_assignment/entity/todo/to_do_entity.dart';
import 'package:flutter_basic_assignment/repoistory/todo/todo_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_view_model.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  Future<List<ToDoEntity>> build() async {
    final todoList = ref.watch(todoRepositoryProvider);

    return await todoList.getTodos();
  }

  void addTodo(ToDoEntity todo) async {
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).addTodo(todo);
      return await ref.read(todoRepositoryProvider).getTodos();
    });
  }

  void deleteTodo(ToDoEntity todo) async {
    state = await AsyncValue.guard(() async {
      if (state.hasValue) {
        await ref.read(todoRepositoryProvider).deleteTodo(todo);
      }
      return await ref.read(todoRepositoryProvider).getTodos();
    });
  }

  void updateTodo(ToDoEntity todo) async {
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).updateTodo(todo);
      return await ref.read(todoRepositoryProvider).getTodos();
    });
  }
}
