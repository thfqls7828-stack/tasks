import 'package:flutter/cupertino.dart';
import 'package:flutter_basic_assignment/entity/to_do_entity.dart';

class TodoProvider extends ChangeNotifier {
  final List<ToDoEntity> _todoList = [];
  List<ToDoEntity> get todoList => _todoList;

  void getTodo(ToDoEntity todo) {
    _todoList.add(todo);
    notifyListeners();
  }
}
