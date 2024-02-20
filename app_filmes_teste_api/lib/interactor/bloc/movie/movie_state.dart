part of '../movie/movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [identityHashCode(this)];
}

final class MovieInitial extends MovieState {
  const MovieInitial();

  @override
  List<Object> get props => [identityHashCode(this)];
}

final class MovieLoading extends MovieState {
  final List<MovieEntity> movies;
  const MovieLoading({required this.movies});

  @override
  List<Object> get props => [identityHashCode(this)];
}

final class MovieLoaded extends MovieState {
  final List<MovieEntity> movies;
  const MovieLoaded({required this.movies});

  @override
  List<Object> get props => [movies, identityHashCode(this)];
}

final class MovieLoadingPaginated extends MovieState {
  const MovieLoadingPaginated();

  @override
  List<Object> get props => [identityHashCode(this)];
}

final class MovieLoadedPaginated extends MovieState {
  final List<MovieEntity> movies;
  const MovieLoadedPaginated({required this.movies});

  @override
  List<Object> get props => [movies, identityHashCode(this)];
}

final class MovieHomeLoading extends MovieState {
  final List<MovieEntity> moviesHome;
  const MovieHomeLoading({required this.moviesHome});

  @override
  List<Object> get props => [moviesHome, identityHashCode(this)];
}

final class MovieHomeLoaded extends MovieState {
  final List<MovieEntity> moviesHome;
  const MovieHomeLoaded({required this.moviesHome});

  @override
  List<Object> get props => [moviesHome, identityHashCode(this)];
}
