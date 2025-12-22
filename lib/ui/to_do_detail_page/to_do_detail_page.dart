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
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(
            todoProvider.todoList[idx].isFavorite
                ? Icons.star
                : Icons.star_border,
          ),
        ],
      ),
      body: Column(
        children: [
          Text("새로운 할 일 2"),
          Row(
            spacing: 10,
            children: [
              Icon(Icons.short_text),
              Text(todoProvider.todoList[idx].description),
              Text("세부 내용은 여기에 작성합니다."),
            ],
          ),
        ],
      ),
    );
  }
}
