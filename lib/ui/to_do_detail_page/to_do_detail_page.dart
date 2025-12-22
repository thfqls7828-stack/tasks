import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/todo_provider.dart';
import 'package:provider/provider.dart';

class ToDoDetailPage extends StatelessWidget {
  const ToDoDetailPage({super.key, required this.idx});

  final int idx;

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 20),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              todoProvider.todoList[idx].isFavorite
                  ? Icons.star
                  : Icons.star_border,
              color: Theme.of(context).dividerColor,
            ),
            onPressed: () => todoProvider.onToggleFavorite(idx),
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
              "새로운 할 일 2",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).dividerColor,
              ),
            ),
            Row(
              spacing: 10,
              children: [
                Icon(Icons.short_text),
                Text(todoProvider.todoList[idx].description ?? ""),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
