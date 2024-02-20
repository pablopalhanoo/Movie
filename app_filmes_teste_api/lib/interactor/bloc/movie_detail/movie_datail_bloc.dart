import 'package:app_filmes_teste_api/data/repositories/movie_detail_repository.dart';
import 'package:app_filmes_teste_api/interactor/entities/movie_detail_entity.dart';
import 'package:app_filmes_teste_api/main.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_datail_event.dart';
part 'movie_datail_state.dart';

class MovieDatailBloc extends Bloc<MovieDatailEvent, MovieDatailState> {
  final MovieDetailApiRepository _repository = getIt.get<MovieDetailApiRepository>();
  MovieDetailEntity? _movie;

  MovieDetailEntity? get movie => _movie;

  MovieDatailBloc() : super(const MovieDatailInitial()) {
    on<InitialMovieDetailLoad>(_getMovieDetail);
  }

  void _getMovieDetail(InitialMovieDetailLoad event, Emitter<MovieDatailState> emit) async {
    try {
      emit(MovieDetailLoading(id: event.id));
      final result = await _repository.getMovieDetail(id: event.id);

      _movie = result;
      emit(MovieDetailLoaded(id: movie!.id));
    } catch (e) {
      emit(const MovieError(error: 'Erro'));
    }
  }
}
