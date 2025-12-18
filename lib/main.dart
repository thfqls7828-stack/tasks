import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/ui/home_page/home_page.dart';
import 'package:flutter_basic_assignment/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: TasksApp(),
    ),
  );
}

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        dividerColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey[350],
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        dividerColor: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(name: "영광"),
    );
  }
}
