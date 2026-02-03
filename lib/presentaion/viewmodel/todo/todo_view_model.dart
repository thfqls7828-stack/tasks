import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/core/di/repository/todo_repository_di.dart';
import 'package:flutter_basic_assignment/domain/entity/todo/todo_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_view_model.g.dart';

class TodoListState {
  final List<ToDoEntity> todos;
  final bool isFetching;
  final bool canLoadMore;
  final DocumentSnapshot? lastDoc;

  TodoListState({
    required this.todos,
    required this.isFetching,
    required this.canLoadMore,
    required this.lastDoc,
  });

  TodoListState copyWith({
    List<ToDoEntity>? todos,
    bool? isFetching,
    bool? canLoadMore,
    DocumentSnapshot? lastDoc,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
      isFetching: isFetching ?? this.isFetching,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      lastDoc: lastDoc ?? this.lastDoc,
    );
  }
}

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  Future<TodoListState> build() async {
    final todoLastDoc = await ref.read(todoRepositoryProvider).getTodos(null);
    final todos = todoLastDoc.todos;

    return TodoListState(
      todos: todos,
      isFetching: false,
      canLoadMore: true,
      lastDoc: todoLastDoc.lastDoc,
    );
  }

  void fetchTodos() async {
    if (!state.value!.canLoadMore ||
        state.value!.isFetching ||
        !state.hasValue) {
      return;
    }

    state = await AsyncValue.guard(() async {
      try {
        state = AsyncData(state.value!.copyWith(isFetching: true));
        final todoLastDoc = await ref
            .read(todoRepositoryProvider)
            .getTodos(state.value!.lastDoc);
        final todos = todoLastDoc.todos;

        return TodoListState(
          todos: [...state.value!.todos, ...todos],
          isFetching: false,
          canLoadMore: todos.length < 15 ? false : true,
          lastDoc: todoLastDoc.lastDoc,
        );
      } catch (e) {
        print("fetchTodos Error: $e");
        rethrow;
      }
    });
  }

  void addTodo(ToDoEntity todo) async {
    state = await AsyncValue.guard(() async {
      try {
        await ref.read(todoRepositoryProvider).addTodo(todo);
        return state.value!.copyWith(todos: [todo, ...state.value!.todos]);
      } catch (e) {
        print("addTodo Error: $e");
        rethrow;
      }
    });
  }

  void deleteTodo(ToDoEntity todo) async {
    if (!state.hasValue) return;

    state = await AsyncValue.guard(() async {
      try {
        await ref.read(todoRepositoryProvider).deleteTodo(todo);
        return state.value!.copyWith(
          todos: state.value!.todos.where((t) => t.id != todo.id).toList(),
        );
      } catch (e) {
        print("deleteTodo Error: $e");
        rethrow;
      }
    });
  }

  void updateTodo(ToDoEntity todo) async {
    if (!state.hasValue) return;
    state = await AsyncValue.guard(() async {
      try {
        await ref.read(todoRepositoryProvider).updateTodo(todo);
        return state.value!.copyWith(
          todos: state.value!.todos
              .map((t) => t.id == todo.id ? todo : t)
              .toList(),
        );
      } catch (e) {
        print("updateTodo Error: $e");
        rethrow;
      }
    });
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(() async {
      try {
        final todoLastDoc = await ref
            .read(todoRepositoryProvider)
            .getTodos(null);

        return TodoListState(
          todos: todoLastDoc.todos,
          isFetching: false,
          canLoadMore: true,
          lastDoc: todoLastDoc.lastDoc,
        );
      } catch (e) {
        print("refresh Error: $e");
        rethrow;
      }
    });
  }
}
