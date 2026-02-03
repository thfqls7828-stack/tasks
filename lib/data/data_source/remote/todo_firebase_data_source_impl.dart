import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_basic_assignment/data/data_source/todo_data_source.dart';
import 'package:flutter_basic_assignment/data/dto/todo/todo_dto.dart';
import 'package:flutter_basic_assignment/data/dto/todo_last_doc/todo_last_doc.dart';

class TodoFirebaseDataSourceImpl implements TodoDataSource {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> addTodo(TodoDto todo) async {
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
  Future<void> deleteTodo(TodoDto todo) async {
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

  @override
  Future<TodoLastDocDto> getTodos(DocumentSnapshot? lastDoc) async {
    try {
      late Query<Map<String, dynamic>> collectionRef;

      if (lastDoc != null) {
        collectionRef = firestore
            .collection("task")
            .orderBy('is_favorite', descending: true)
            .orderBy('is_done', descending: false)
            .startAfterDocument(lastDoc)
            .limit(15);
      } else {
        collectionRef = firestore
            .collection("task")
            .orderBy('is_favorite', descending: true)
            .orderBy('is_done', descending: false)
            .limit(15);
      }

      final docRef = await collectionRef.get();
      final queryDocumentSnapshot = docRef.docs;

      if (queryDocumentSnapshot.isEmpty) {
        return TodoLastDocDto(todos: [], lastDoc: null);
      }

      return TodoLastDocDto(
        todos: queryDocumentSnapshot
            .map((document) => TodoDto.fromJson(document.data()))
            .toList(),
        lastDoc: queryDocumentSnapshot.last,
      );
    } on FirebaseException catch (e) {
      throw '서버 연결 문제 ${e.code}';
    } catch (e) {
      throw '알 수 없는 문제';
    }
  }

  @override
  Future<void> updateTodo(TodoDto todo) async {
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
