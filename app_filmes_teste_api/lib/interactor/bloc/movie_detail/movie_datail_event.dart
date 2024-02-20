part of 'movie_datail_bloc.dart';

sealed class MovieDatailEvent {
  const MovieDatailEvent();
}

final class InitialMovieDetailLoad extends MovieDatailEvent {
  final int id;
  const InitialMovieDetailLoad({required this.id});
}
