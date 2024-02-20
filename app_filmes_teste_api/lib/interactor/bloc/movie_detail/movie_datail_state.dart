part of 'movie_datail_bloc.dart';

sealed class MovieDatailState extends Equatable {
  const MovieDatailState();

  @override
  List<Object> get props => [];
}

final class MovieDatailInitial extends MovieDatailState {
  const MovieDatailInitial();

  @override
  List<Object> get props => [];
}

final class MovieDetailLoading extends MovieDatailState {
  final int id;
  const MovieDetailLoading({required this.id});

  @override
  List<Object> get props => [id, identityHashCode(this)];
}

final class MovieDetailLoaded extends MovieDatailState {
  final int id;
  const MovieDetailLoaded({required this.id});

  @override
  List<Object> get props => [id, identityHashCode(this)];
}

final class MovieError extends MovieDatailState {
  final String error;
  const MovieError({required this.error});

  @override
  List<Object> get props => [error, identityHashCode(this)];
}
