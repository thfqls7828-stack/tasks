import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/ui/error/error_page.dart';
import 'package:flutter_basic_assignment/ui/home_page/initail_page.dart';
import 'package:flutter_basic_assignment/ui/home_page/task_page.dart';
import 'package:flutter_basic_assignment/ui/home_page/widgets/bottom_sheet_add_to_do.dart';
import 'package:flutter_basic_assignment/viewmodel/todo/todo_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// first Page - HomePage
class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.name});

  // 사용자 이름
  final String name;

  // btn onClick
  void addTodo(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      enableDrag: false,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return BottomSheetAddToDo();
      },
    );
  }

  // Scaffold
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoAsyncValue = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$name's Tasks",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).dividerColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: todoAsyncValue.when(
          data: (todos) {
            return todos.isEmpty ? InitailPage(name: name) : TaskPage();
          },
          error: (error, stackTrace) {
            return ErrorPage(error: error);
          },
          loading: () {
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).highlightColor,
        shape: CircleBorder(),
        onPressed: () {
          addTodo(context);
        },
        child: Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}
