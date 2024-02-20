import 'package:app_filmes_teste_api/data/repositories/genre_api_repository.dart';
import 'package:app_filmes_teste_api/data/repositories/movie_api_repository.dart';
import 'package:app_filmes_teste_api/data/repositories/movie_detail_repository.dart';
import 'package:app_filmes_teste_api/main.dart';

class Initializer {
  static Future<void> init() async {
    getIt.registerFactory<GenreApiRepository>(() => GenreApiRepository());
    getIt.registerFactory<MovieApiRepository>(() => MovieApiRepository());
    getIt.registerFactory<MovieDetailApiRepository>(() => MovieDetailApiRepository());
  }
}
