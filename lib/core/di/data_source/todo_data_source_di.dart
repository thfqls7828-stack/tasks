import 'package:flutter_basic_assignment/data/data_source/remote/todo_firebase_data_source_impl.dart';
import 'package:flutter_basic_assignment/data/data_source/todo_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoDataSourceProvider = Provider<TodoDataSource>((ref) {
  return TodoFirebaseDataSourceImpl();
});
