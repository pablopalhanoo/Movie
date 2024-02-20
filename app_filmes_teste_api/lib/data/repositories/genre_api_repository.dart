import 'package:app_filmes_teste_api/data/clients/api_client_endpoints.dart';
import 'package:app_filmes_teste_api/interactor/entities/genre_entity.dart';
import 'package:dio/dio.dart';

class GenreApiRepository {
  static final Dio _dio = Dio();

  get id => null;

  Future<List<GenreEntity>> getAllGenreMovie() async {
    final result = await _dio.get('${Constants.baseURL}${Constants.genreEndpoint}');

    if ((result.statusCode ?? 1000) < 300) {
      return (result.data['genres'] as List<dynamic>).map((e) => GenreEntity.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}
