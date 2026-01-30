import 'package:flutter_basic_assignment/data/data_source/remote/todo_firebase_data_source_impl.dart';
import 'package:flutter_basic_assignment/data/data_source/todo_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
TodoDataSource todoDataSourceProvider(Ref ref) {
  return TodoFirebaseDataSourceImpl();
}
