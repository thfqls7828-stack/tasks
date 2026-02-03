import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/domain/entity/todo/todo_entity.dart';
import 'package:flutter_basic_assignment/presentaion/viewmodel/todo/todo_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Provider has Data
class TaskPage extends ConsumerWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoListProvider);

    return state.when(
      data: (state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  if (notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent) {
                    ref.read(todoListProvider.notifier).fetchTodos();
                    return false;
                  }
                }
                return false;
              },
              child: RefreshIndicator(
                onRefresh: () async {
                  await ref.read(todoListProvider.notifier).refresh();
                },
                child: ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];

                    return GestureDetector(
                      onTap: () {
                        context.goNamed(
                          'detail',
                          pathParameters: {'id': todo.id, 'name': '영광'},
                        );
                      },
                      child: TodoView(todo: todo),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}

class TodoView extends ConsumerWidget {
  const TodoView({super.key, required this.todo});

  final ToDoEntity todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) =>
          ref.read(todoListProvider.notifier).deleteTodo(todo),
      background: SizedBox(),
      secondaryBackground: Icon(Icons.delete),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          spacing: 12,
          children: [
            IconButton(
              onPressed: () {
                ref
                    .read(todoListProvider.notifier)
                    .updateTodo(todo.copyWith(isDone: !todo.isDone));
              },
              icon: Icon(
                todo.isDone ? Icons.check_circle : Icons.circle_outlined,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Hero(
                tag: todo.id,
                flightShuttleBuilder:
                    (
                      flightContext,
                      animation,
                      flightDirection,
                      fromHeroContext,
                      toHeroContext,
                    ) {
                      final textStyle = DefaultTextStyle.of(
                        toHeroContext,
                      ).style;

                      return FittedBox(
                        child: DefaultTextStyle(
                          style: textStyle,
                          child: toHeroContext.widget,
                        ),
                      );
                    },
                child: AutoSizeText(
                  todo.title,
                  maxLines: 1,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decorationThickness: 3,
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                ref
                    .read(todoListProvider.notifier)
                    .updateTodo(todo.copyWith(isFavorite: !todo.isFavorite));
              },
              icon: Icon(
                todo.isFavorite ? Icons.star : Icons.star_border,
                color: Colors.red[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
