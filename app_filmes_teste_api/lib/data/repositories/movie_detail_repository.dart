import 'package:app_filmes_teste_api/data/clients/api_client_endpoints.dart';
import 'package:app_filmes_teste_api/interactor/entities/movie_detail_entity.dart';
import 'package:dio/dio.dart';

class MovieDetailApiRepository {
  static final Dio _dio = Dio();

  get id => null;

  Future<MovieDetailEntity> getMovieDetail({required int id}) async {
    final result = await _dio.get('${Constants.baseURL}${Constants.movieDetail}$id${Constants.key}');

    if ((result.statusCode ?? 1000) < 300) {
      return MovieDetailEntity.fromjson(result.data);
    } else {
      throw Exception();
    }
  }
}
