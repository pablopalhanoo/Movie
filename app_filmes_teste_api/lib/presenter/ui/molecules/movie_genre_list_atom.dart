import 'package:app_filmes_teste_api/data/clients/api_client_endpoints.dart';
import 'package:app_filmes_teste_api/data/repositories/movie_api_repository.dart';
import 'package:app_filmes_teste_api/interactor/entities/movie_entity.dart';
import 'package:app_filmes_teste_api/presenter/nav/routes.dart';
import 'package:flutter/material.dart';

class MovieGenreListAtom extends StatefulWidget {
  final bool isLoading;
  final List<MovieEntity> movies;
  final ScrollController scrollController;
  final List<int> id;
  const MovieGenreListAtom({
    super.key,
    required this.isLoading,
    required this.movies,
    required this.scrollController,
    required this.id,
  });

  @override
  State<MovieGenreListAtom> createState() => _MovieGenreListAtomState();
}

class _MovieGenreListAtomState extends State<MovieGenreListAtom> {
  late List<MovieEntity> movies;
  final MovieApiRepository repository = MovieApiRepository();

  @override
  void initState() {
    movies = widget.movies;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? Container()
        : GridView.builder(
            itemCount: movies.length,
            controller: widget.scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                key: ValueKey(movie.id),
                onTap: () => goTopageNamed(context: context, name: 'moviedetail', params: {'id': movie.id.toString()}),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.grey[800]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(
                            Constants.baseURLImage + movie.posterPath,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress != null) {
                                return const Center(child: CircularProgressIndicator());
                              } else {
                                return child;
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          movie.title,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
