part of 'genre_bloc.dart';

sealed class GenreEvent {
  const GenreEvent();
}

final class InitialGenreLoad extends GenreEvent {
  const InitialGenreLoad();
}
