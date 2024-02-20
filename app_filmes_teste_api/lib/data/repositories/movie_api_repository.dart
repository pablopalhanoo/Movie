import 'package:app_filmes_teste_api/data/clients/api_client_endpoints.dart';
import 'package:app_filmes_teste_api/interactor/entities/movie_pagination_entity.dart';
import 'package:dio/dio.dart';

class MovieApiRepository {
  static final Dio _dio = Dio();

  get id => null;

  Future<MoviePaginationEntity> getMovieByGenre({required int? page, required List<int> GenreId}) async {
    final result = await _dio.get('${Constants.baseURL}${Constants.discover}${Constants.filterGenre}${GenreId.join(',')}${Constants.page}$page');

    if ((result.statusCode ?? 1000) < 300) {
      return MoviePaginationEntity.fromjson(result.data);
    } else {
      throw Exception();
    }
  }
}
