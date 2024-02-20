part of 'genre_bloc.dart';

sealed class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

final class GenreInitial extends GenreState {
  const GenreInitial();
  @override
  List<Object> get props => [identityHashCode(this)];
}

final class GenreLoading extends GenreState {
  final List<GenreEntity> genre;
  const GenreLoading({required this.genre});
  @override
  List<Object> get props => [identityHashCode(this)];
}

final class GenreLoaded extends GenreState {
  final List<GenreEntity> genre;
  const GenreLoaded({required this.genre});
  @override
  List<Object> get props => [identityHashCode(this)];
}
