import 'package:flutter/cupertino.dart';
import 'package:flutter_basic_assignment/entity/to_do_entity.dart';

class TodoProvider extends ChangeNotifier {
  final List<ToDoEntity> _todoList = [];
  get todoList => _todoList;

  void getTodo(ToDoEntity todo) {
    _todoList.add(todo);
    notifyListeners();
  }

  int getListLength() {
    return _todoList.length;
  }

  bool isEmpty() {
    return _todoList.isEmpty;
  }

  void deleteTodo(int idx) {
    _todoList.removeAt(idx);
    notifyListeners();
  }

  void onToggleDone(int idx) {
    bool isDone = _todoList[idx].isDone;
    _todoList[idx] = _todoList[idx].copyWith(null, !isDone);

    notifyListeners();
  }

  void onToggleFavorite(int idx) {
    bool isFavorite = _todoList[idx].isFavorite;
    _todoList[idx] = _todoList[idx].copyWith(!isFavorite, null);

    notifyListeners();
  }
}
