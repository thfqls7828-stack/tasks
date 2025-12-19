import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/todo_provider.dart';
import 'package:flutter_basic_assignment/ui/home_page/initail_page.dart';
import 'package:flutter_basic_assignment/ui/home_page/task_page.dart';
import 'package:flutter_basic_assignment/ui/home_page/widgets/bottom_sheet_add_to_do.dart';
import 'package:provider/provider.dart';

// first Page - HomePage
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.name});

  // 사용자 이름
  final String name;

  // btn onClick
  void addTodo(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return BottomSheetAddToDo();
      },
    );
  }

  // Scaffold
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$name's Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: todoProvider.isEmpty() ? InitailPage(name: name) : TaskPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        shape: CircleBorder(),
        onPressed: () {
          addTodo(context);
        },
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}
