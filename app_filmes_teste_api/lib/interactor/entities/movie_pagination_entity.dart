import 'package:app_filmes_teste_api/interactor/entities/movie_entity.dart';

class MoviePaginationEntity {
  final List<MovieEntity> movies;
  final int pages;

  MoviePaginationEntity({
    required this.movies,
    required this.pages,
  });

  factory MoviePaginationEntity.fromjson(Map<String, dynamic> json) {
    return MoviePaginationEntity(
      movies: (json['results'] as List<dynamic>).map((e) => MovieEntity.fromjson(e)).toList(),
      pages: json['page'],
    );
  }
}
