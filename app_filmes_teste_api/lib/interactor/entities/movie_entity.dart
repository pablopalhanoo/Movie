class MovieEntity {
  final String title;
  final int id;
  final String posterPath;
  final List<int> GenreID;
  final String overView;
  final double vote;

  MovieEntity({
    required this.title,
    required this.id,
    required this.posterPath,
    required this.GenreID,
    required this.overView,
    required this.vote,
  });

  factory MovieEntity.fromjson(Map<String, dynamic> json) {
    return MovieEntity(
        title: json['title'],
        id: json['id'],
        posterPath: json['poster_path'],
        GenreID: List<int>.from(json['genre_ids']),
        overView: json['overview'],
        vote: json['vote_average']);
  }
  Map<String, dynamic> tojson() => {
        'title': title,
        'id': id,
        'poster_path': posterPath,
        'genre_ids': GenreID,
        'overview': overView,
        'vote_average': vote,
      };
}
