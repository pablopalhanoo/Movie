import 'package:app_filmes_teste_api/data/repositories/genre_api_repository.dart';
import 'package:app_filmes_teste_api/interactor/entities/genre_entity.dart';
import 'package:app_filmes_teste_api/main.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GenreApiRepository _repository = getIt.get<GenreApiRepository>();
  final List<GenreEntity> _genre = [];

  List<GenreEntity> get genre => _genre;
  GenreBloc() : super(const GenreInitial()) {
    on<InitialGenreLoad>(_getGenres);
  }

  void _getGenres(InitialGenreLoad event, Emitter<GenreState> emit) async {
    try {
      _genre.clear();
      emit(GenreLoading(genre: _genre));
      final result = await _repository.getAllGenreMovie();

      _genre.addAll(result as Iterable<GenreEntity>);

      emit(GenreLoaded(genre: _genre));
    } catch (e) {
      const Text('Erro');
    }
  }
}
