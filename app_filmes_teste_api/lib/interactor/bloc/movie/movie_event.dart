part of '../movie/movie_bloc.dart';

sealed class MovieEvent {
  const MovieEvent();
}

final class InitialMovieLoad extends MovieEvent {
  List<int> id;
  InitialMovieLoad({required this.id});
}

final class GetMovies extends MovieEvent {}

final class GetMoreMovies extends MovieEvent {
  List<int> id;
  GetMoreMovies({required this.id});
}

final class GetHomePageMovies extends MovieEvent {
  List<int> id;
  GetHomePageMovies({required this.id});
}
