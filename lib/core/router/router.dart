import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_basic_assignment/presentaion/home_page/home_page.dart';
import 'package:flutter_basic_assignment/presentaion/to_do_detail_page/to_do_detail_page.dart';

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
