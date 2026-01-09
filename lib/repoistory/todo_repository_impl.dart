import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/entity/to_do_entity.dart';
import 'package:flutter_basic_assignment/repoistory/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> addTodo(ToDoEntity todo) async {
    final collectionRef = firestore.collection("task");
    final docRef = collectionRef.doc();

    Map<String, dynamic> data = todo.toJson();

    await docRef.set(data);
  }

  @override
  Future<void> deleteTodo(ToDoEntity todo) async {
    final collectionRef = firestore.collection("task");
    final docRef = collectionRef.doc(todo.id);

    await docRef.delete();
  }

  @override
  Future<List<ToDoEntity>> getTodos() async {
    final collectionRef = firestore
        .collection("task")
        .orderBy('isFavorite', descending: true);
    final docRef = await collectionRef.get();
    final queryDocumentSnapshot = docRef.docs;
    final List<ToDoEntity> todoList = [];

    for (final document in queryDocumentSnapshot) {
      final todo = ToDoEntity.fromJson(document.data());
      todoList.add(todo);
    }

    return todoList;
  }

  @override
  Future<void> updateTodo(ToDoEntity todo) async {
    final collectionRef = firestore.collection('task');
    final docRef = collectionRef.doc(todo.id);
    final Map<String, dynamic> todoMap = todo.toJson();

    await docRef.update(todoMap);
  }
}
