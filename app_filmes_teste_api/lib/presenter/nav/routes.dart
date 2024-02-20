import 'package:app_filmes_teste_api/presenter/pages/create_login_page.dart';
import 'package:app_filmes_teste_api/presenter/pages/genres_page.dart';
import 'package:app_filmes_teste_api/presenter/pages/homepage_page.dart';
import 'package:app_filmes_teste_api/presenter/pages/login_page.dart';
import 'package:app_filmes_teste_api/presenter/pages/movie_detail_page.dart';
import 'package:app_filmes_teste_api/presenter/pages/movie_genre_list_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void goTopageNamed({required BuildContext context, required String name, Map<String, String>? params}) {
  if (kIsWeb) {
    context.goNamed(name, pathParameters: params ?? {});
  } else {
    context.pushNamed(name, pathParameters: params ?? {});
  }
}

void goToLocation({required BuildContext context, required String path, List<String>? queries}) {
  if (kIsWeb) {
    context.go(queries != null ? '$path${queries.join()}' : path);
  } else {
    context.push(queries != null ? '$path${queries.join()}' : path);
  }
}

final routes = GoRouter(
  initialLocation: '/loginpage',
  routes: [
    GoRoute(
      path: '/loginpage',
      name: 'loginpage',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/createloginpage',
      name: 'createloginpage',
      builder: (context, state) => const CreateLoginPage(),
    ),
    GoRoute(
      path: '/homepage',
      name: 'homepage',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/allgenres',
      name: 'allgenres',
      builder: (context, state) => const GenresPage(),
    ),
    GoRoute(
      path: '/movielist-:id',
      name: 'movielist',
      builder: (context, state) => MovieGenreListPage(id: int.tryParse(state.pathParameters['id'] ?? '0') ?? 0),
    ),
    GoRoute(
      path: '/moviedetail-:id',
      name: 'moviedetail',
      builder: (context, state) => MovieDatailPage(id: int.tryParse(state.pathParameters['id'] ?? '0') ?? 0),
    ),
  ],
);
