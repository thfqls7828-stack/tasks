import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/todo_provider.dart';
import 'package:provider/provider.dart';

// Provider has Data
class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return ListView.builder(
      itemCount: TodoProvider().getListLength(),
      itemBuilder: (context, index) {
        return Container(child: Text(todoProvider.todoList[index].title));
      },
    );
  }
}
