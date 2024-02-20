import 'package:app_filmes_teste_api/initializer.dart';
import 'package:app_filmes_teste_api/interactor/bloc/genre/genre_bloc.dart';
import 'package:app_filmes_teste_api/interactor/bloc/movie/movie_bloc.dart';
import 'package:app_filmes_teste_api/interactor/bloc/movie_detail/movie_datail_bloc.dart';
import 'package:app_filmes_teste_api/presenter/nav/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() async {
  await Initializer.init();
  runApp(_wrapProviders(const MyApp()));
}

MultiBlocProvider _wrapProviders(Widget app) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => GenreBloc()),
      BlocProvider(create: (context) => MovieBloc()),
      BlocProvider(create: (context) => MovieDatailBloc()),
    ],
    child: app,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      routerConfig: routes,
    );
  }
}
