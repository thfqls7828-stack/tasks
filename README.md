# 🔎 Todo App - riverpod
## ⭐ 프로그래밍 요구사항

### Clean Architecture를 적용하여 패키지를 다시 구성
```
lib/
├── core/                # 앱 전체에서 공유되는 공통 기능 (에러 처리, 네트워크 설정 등)
├── data/                # 데이터 소스 관리 (API 호출, 로컬 DB, Repository 구현체)
├── domain/              # 비즈니스 로직의 핵심 (Entity, UseCase, Repository 인터페이스)
├── presentaion/         # UI 레이어 (Screen, Widget, State Management/Bloc/Provider)
├── firebase_options.dart # Firebase 프로젝트 설정 파일
└── main.dart            # 앱의 시작점 및 초기화 로직
```

### Material Navigator -> GoRouter
```dart
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/영광', // 명시하지 않으면 '/'로 이동
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      name: 'home',
      path: '/:name',
      builder: (context, state) {
        final name = state.pathParameters['name']!;
        return HomePage(name: name);
      },
      routes: [
        GoRoute(
          name: 'detail',
          path: 'detail/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return ToDoDetailPage(id: id);
          },
        ),
      ],
    ),
  ],
);
```

## ⭐ 구현

#### UI
<img width="300" height="600" alt="Screenshot_1768390269" src="https://github.com/user-attachments/assets/1a4580b6-d2b3-46b3-b60d-a70a55225ea9" />
<img width="300" height="600" alt="Screenshot_1768390290" src="https://github.com/user-attachments/assets/ff809e12-77a8-4d9e-a3a7-c2d95e96d42a" />
<img width="300" height="600" alt="Screenshot_1768390613" src="https://github.com/user-attachments/assets/61379d81-7293-4fd3-ab1f-159b9c648857" />
<img width="300" height="600" alt="Screenshot_1768390732" src="https://github.com/user-attachments/assets/113baeaa-a82c-424f-b470-f456e0425e34" />
<img width="300" height="600" alt="Screenshot_1770126255" src="https://github.com/user-attachments/assets/f7fb61fd-926a-44ff-9ce9-a057c0a11b7b" />
<img width="600" height="300" alt="Screenshot_1770126265" src="https://github.com/user-attachments/assets/4932592f-8c15-4c01-a56f-bb7156e6357e" />


## ⭐ 수정 및 추가된 기능
- 반응형 UI
- Debouncer를 통한 Event 전송 주기 설정
- Refresh 기능
- Infinite Scrolling 
