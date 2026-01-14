import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/entity/todo/to_do_entity.dart';
import 'package:flutter_basic_assignment/repoistory/todo/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_repository_impl.g.dart';

class TodoRepositoryImpl implements TodoRepository {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> addTodo(ToDoEntity todo) async {
    try {
      final collectionRef = firestore.collection("task");
      final docRef = collectionRef.doc();
      Map<String, dynamic> data = todo.copyWith(id: docRef.id).toJson();

      await docRef.set(data);
    } on FirebaseException catch (e) {
      throw '서버 연결 문제 ${e.code}';
    } catch (e) {
      throw '알 수 없는 문제';
    }
  }

  @override
  Future<void> deleteTodo(ToDoEntity todo) async {
    try {
      final collectionRef = firestore.collection("task");
      final docRef = collectionRef.doc(todo.id);

      await docRef.delete();
    } on FirebaseException catch (e) {
      throw '서버 연결 문제 ${e.code}';
    } catch (e) {
      throw '알 수 없는 문제';
    }
  }

  //orderBy indexing err

  @override
  Future<List<ToDoEntity>> getTodos() async {
    try {
      final collectionRef = firestore
          .collection("task")
          .orderBy('is_favorite', descending: true);
      final docRef = await collectionRef.get();
      final queryDocumentSnapshot = docRef.docs;

      return queryDocumentSnapshot
          .map((document) => ToDoEntity.fromJson(document.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw '서버 연결 문제 ${e.code}';
    } catch (e) {
      throw '알 수 없는 문제';
    }
  }

  @override
  Future<void> updateTodo(ToDoEntity todo) async {
    try {
      final collectionRef = firestore.collection('task');
      final docRef = collectionRef.doc(todo.id);
      final Map<String, dynamic> todoMap = todo.toJson();

      await docRef.update(todoMap);
    } on FirebaseException catch (e) {
      throw '서버 연결 문제 ${e.code}';
    } catch (e) {
      throw '알 수 없는 문제';
    }
  }
}

@riverpod
TodoRepository todoRepository(Ref ref) {
  return TodoRepositoryImpl();
}
