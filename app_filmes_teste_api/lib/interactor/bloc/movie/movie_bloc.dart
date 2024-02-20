import 'package:app_filmes_teste_api/data/repositories/movie_api_repository.dart';
import 'package:app_filmes_teste_api/interactor/entities/movie_entity.dart';
import 'package:app_filmes_teste_api/main.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part '../movie/movie_event.dart';
part '../movie/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieApiRepository _repository = getIt.get<MovieApiRepository>();
  final List<MovieEntity> _movies = [];
  final List<MovieEntity> _moviesHomePage = [];
  int _page = 1;

  List<MovieEntity> get movie => _movies;
  List<MovieEntity> get movieHomePage => _moviesHomePage;
  int get page => _page;

  MovieBloc() : super(const MovieInitial()) {
    on<InitialMovieLoad>(_initialLoad);
    on<GetMoreMovies>(_getMoreMovies);
    on<GetHomePageMovies>(_getHomepageMovies);
  }

  void _initialLoad(InitialMovieLoad event, Emitter<MovieState> emit) async {
    try {
      _movies.clear();
      _page = 1;
      emit(MovieLoading(movies: _movies));
      final result = await _repository.getMovieByGenre(page: _page, GenreId: event.id);

      _movies.addAll(result.movies);
      _page = result.pages;

      emit(MovieLoaded(movies: _movies));
    } catch (e) {
      const Text('Erro ao carregar filmes');
    }
  }

  void _getMoreMovies(GetMoreMovies event, Emitter<MovieState> emit) async {
    try {
      _page++;
      emit(const MovieLoadingPaginated());
      final result = await _repository.getMovieByGenre(page: _page, GenreId: event.id);

      _movies.addAll(result.movies);
      _page = result.pages;

      emit(MovieLoadedPaginated(movies: _movies));
    } catch (e) {
      const Text('Erro ao carregar mais filmes');
    }
  }

  void _getHomepageMovies(GetHomePageMovies event, Emitter<MovieState> emit) async {
    try {
      // _moviesHomePage.clear();
      _page = 1;
      emit(MovieHomeLoading(moviesHome: _moviesHomePage));

      while (_movies.length < 100) {
        final result = await _repository.getMovieByGenre(page: _page, GenreId: event.id);

        _moviesHomePage.addAll(result.movies);
        _page++;
      }

      if (_moviesHomePage.length >= 100) {
        emit(MovieHomeLoaded(moviesHome: _moviesHomePage));
        return;
      }

      emit(MovieHomeLoaded(moviesHome: _moviesHomePage));
    } catch (e) {
      const Text('Erro ao carregar filmes');
    }
  }
}
