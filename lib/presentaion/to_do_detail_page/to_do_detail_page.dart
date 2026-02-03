import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/presentaion/viewmodel/todo/todo_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ToDoDetailPage extends ConsumerWidget {
  const ToDoDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoAsyncValue = ref.watch(todoListProvider);

    return todoAsyncValue.when(
      data: (state) {
        final todo = state.todos.firstWhere((e) {
          return e.id == id;
        });

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Hero(tag: todo.id, child: Text(todo.title)),
            actionsPadding: EdgeInsets.symmetric(horizontal: 20),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  todo.isFavorite ? Icons.star : Icons.star_border,
                  color: Colors.red[300],
                ),
                onPressed: () {
                  ref
                      .read(todoListProvider.notifier)
                      .updateTodo(todo.copyWith(isFavorite: !todo.isFavorite));
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                Row(
                  spacing: 10,
                  children: [Icon(Icons.short_text), Text(todo.des ?? "")],
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return CircularProgressIndicator();
      },
    );
  }
}
