import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/todo_provider.dart';
import 'package:flutter_basic_assignment/ui/to_do_detail_page/to_do_detail_page.dart';
import 'package:provider/provider.dart';

// Provider has Data
class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return ListView.builder(
      itemCount: todoProvider.getListLength(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ToDoDetailPage(idx: index),
              ),
            );
          },
          child: TodoView(idx: index),
        );
      },
    );
  }
}

class TodoView extends StatelessWidget {
  const TodoView({super.key, required this.idx});

  final int idx;

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Container(
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
              todoProvider.onToggleDone(idx);
            },
            icon: Icon(
              todoProvider.todoList[idx].isDone
                  ? Icons.check_circle
                  : Icons.circle_outlined,
              color: Theme.of(context).dividerColor,
            ),
          ),
          Text(
            todoProvider.todoList[idx].title,
            style: TextStyle(
              decoration: todoProvider.todoList[idx].isDone
                  ? TextDecoration.lineThrough
                  : null,
              color: Theme.of(context).dividerColor,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => todoProvider.onToggleFavorite(idx),
            icon: Icon(
              todoProvider.todoList[idx].isFavorite
                  ? Icons.star
                  : Icons.star_border,
              color: Theme.of(context).dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
