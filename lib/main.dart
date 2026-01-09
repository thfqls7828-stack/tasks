import 'package:flutter/material.dart';
import 'package:flutter_basic_assignment/bottom_sheet_provider.dart';
import 'package:flutter_basic_assignment/core/theme/themes.dart';
import 'package:flutter_basic_assignment/ui/home_page/home_page.dart';
import 'package:flutter_basic_assignment/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ProviderScope(child: TasksApp()));
}

class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: HomePage(name: "영광"),
    );
  }
}
