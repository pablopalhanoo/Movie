import 'package:app_filmes_teste_api/interactor/entities/genre_entity.dart';

class MovieDetailEntity {
  final String title;
  final int id;
  final String posterPath;
  final List<GenreEntity> genreID;
  final String overView;
  final double vote;
  final int runTime;

  MovieDetailEntity(
      {required this.title,
      required this.id,
      required this.posterPath,
      required this.genreID,
      required this.overView,
      required this.vote,
      required this.runTime});

  factory MovieDetailEntity.fromjson(Map<String, dynamic> json) {
    return MovieDetailEntity(
      title: json['title'],
      id: json['id'],
      posterPath: json['poster_path'],
      genreID: (json['genres'] as List<dynamic>).map((e) => GenreEntity.fromJson(e)).toList(),
      overView: json['overview'],
      vote: json['vote_average'],
      runTime: json['runtime'],
    );
  }
  Map<String, dynamic> tojson() => {
        'title': title,
        'id': id,
        'poster_path': posterPath,
        'genre_ids': genreID,
        'overview': overView,
        'vote_average': vote,
        'runtime': runTime,
      };
}
