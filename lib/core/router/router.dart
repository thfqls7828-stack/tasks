import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_basic_assignment/presentaion/home_page/home_page.dart';
import 'package:flutter_basic_assignment/presentaion/to_do_detail_page/to_do_detail_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    initialLocation: '/영광',
    navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: '/:name',
      builder: (context, state) {
        final name = (state.extra as Map<String, dynamic>?)?['name'] ?? 'Guest';
        return HomePage(name: name);
      },
    ),
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ToDoDetailPage(id: id);
      },
    ),
  ],
);