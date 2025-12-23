# 🔎 Todo App
## 프로그래밍 요구사항
### Todo Entity 정의
```dart
 final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;
```

### 기본 화면(Todo List가 없는 화면) 만들기
- "name"을 입력 받아 AppBar에 적용
- Container를 통해 Todo가 없음을 표시
- FAB를 통해 Todo 추가 기능 구현

### Todo를 추가하는 화면 만들기
- FAB를 누르면 Modal BottomSheet를 띄움
- BottomSheet에는 사용자에게 할 일을 입력 받아 저장
- 저장 버튼은 사용자의 입력값 유무에 따라 색상 변경 기능
- 저장 버튼 클릭 시, Todo 저장하며 TaskPage로 전환

### Todo가 추가된 화면 만들기
- 각 Todo마다 Container로 구현
- Container는 isDone, title, isFavorite가 표시되어있음
- isDone, isFavorite 버튼은 터치 시, Toggle 적용
- title은 클릭 시, TodoDetailPage로 이동

### Todo 상세보기 화면 만들기
- AppBar의 actions에 즐겨찾기 선택 기능 구현
- TodoEntity의 des 필드를 body 부분에 띄워줌

## 구현
<img width="300" height="600" alt="Screenshot_1766463347" src="https://github.com/user-attachments/assets/f9173dd9-1134-42e2-a583-48fc7613ea7f" />
<img width="300" height="600" alt="Screenshot_1766463457" src="https://github.com/user-attachments/assets/da959f5d-174f-4328-be6d-ea17525cf0f5" />


<img width="300" height="600" alt="Screenshot_1766463528" src="https://github.com/user-attachments/assets/e69f390b-1093-4968-a996-9113ba943112" />
<img width="300" height="600" alt="Screenshot_1766464363" src="https://github.com/user-attachments/assets/08b2bdef-ca80-46d0-9b9c-5a5bcdff1935" />


## 도전 기능
### 다크테마 구현
<img width="300" height="600" alt="Screenshot_1766464453" src="https://github.com/user-attachments/assets/ce8e5d01-b215-4ce7-a146-c008dfbc103a" />
<img width="300" height="600" alt="Screenshot_1766464449" src="https://github.com/user-attachments/assets/9c33265d-d209-4710-8ac5-6ecb71eef90e" />

### 위젯 컴포넌트화
- Details
- TodoView
- BottomSheet

### UX(사용자 경험)를 고려한 기능 추가하기
- Swipe로 Todo 삭제 기능
<img width="500" height="1000" alt="Screenshot_1766464496" src="https://github.com/user-attachments/assets/39a688ad-08fa-4eb2-b271-b2ece1c0d53a" />
