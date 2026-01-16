# 🔎 Todo App - riverpod
## ⭐ 프로그래밍 요구사항
### Todo Entity 정의
```dart
part 'to_do_entity.freezed.dart';
part 'to_do_entity.g.dart';

@freezed
abstract class ToDoEntity with _$ToDoEntity {
  const factory ToDoEntity({
    required String id,
    required String title,
    String? des,
    @JsonKey(name: "is_favorite") required bool isFavorite,
    @JsonKey(name: "is_done") required bool isDone,
  }) = _ToDoEntity;

  factory ToDoEntity.fromJson(Map<String, dynamic> json) =>
      _$ToDoEntityFromJson(json);
}
```

### Firebase 연동
<img width="768" height="304" alt="image" src="https://github.com/user-attachments/assets/4a1610a9-f1b3-4575-be1e-482af998dad8" />


### MVVM 모델을 적용하여 패키지를 다시 구성
<img width="307" height="439" alt="image" src="https://github.com/user-attachments/assets/638a8e42-ea26-41ca-8de5-16e110ed405b" />


#### Repository interface
```dart
abstract class TodoRepository {
  // Todo 추가
  Future<void> addTodo(ToDoEntity todo);

  // Todo 내용 업데이트
  Future<void> updateTodo(ToDoEntity todo);

  // Todo 삭제
  Future<void> deleteTodo(ToDoEntity todo);

  // 전체 Todo 목록 불러오기
  Future<List<ToDoEntity>> getTodos();
}
```
#### ViewModel
```dart

part 'todo_view_model.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  Future<List<ToDoEntity>> build() async {
    final todoList = ref.watch(todoRepositoryProvider);

    return await todoList.getTodos();
  }

  void addTodo(ToDoEntity todo) async {
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).addTodo(todo);
      return await ref.read(todoRepositoryProvider).getTodos();
    });
  }

  void deleteTodo(ToDoEntity todo) async {
    state = await AsyncValue.guard(() async {
      if (state.hasValue) {
        await ref.read(todoRepositoryProvider).deleteTodo(todo);
      }
      return await ref.read(todoRepositoryProvider).getTodos();
    });
  }

  void updateTodo(ToDoEntity todo) async {
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).updateTodo(todo);
      return await ref.read(todoRepositoryProvider).getTodos();
    });
  }
}

```

## ⭐ 구현

#### UI
<img width="300" height="600" alt="Screenshot_1768390269" src="https://github.com/user-attachments/assets/1a4580b6-d2b3-46b3-b60d-a70a55225ea9" />
<img width="300" height="600" alt="Screenshot_1768390290" src="https://github.com/user-attachments/assets/ff809e12-77a8-4d9e-a3a7-c2d95e96d42a" />
<img width="300" height="600" alt="Screenshot_1768390613" src="https://github.com/user-attachments/assets/61379d81-7293-4fd3-ab1f-159b9c648857" />
<img width="300" height="600" alt="Screenshot_1768390732" src="https://github.com/user-attachments/assets/113baeaa-a82c-424f-b470-f456e0425e34" />

#### Firebase
<img width="1000" height="600" alt="image" src="https://github.com/user-attachments/assets/97a12308-7a4e-4dc9-ad41-270557672db8" />


## ⭐ 수정 및 추가된 기능
- ModalBottomSheet Dismissible 기능 추가
- TextField 데이터 리셋 기능 추가
- 즐겨찾기 색상 변경
- DetailPage title 표시
- 즐겨찾기 순서대로 내림차순 정렬
