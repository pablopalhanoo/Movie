import 'package:app_filmes_teste_api/data/clients/api_client_endpoints.dart';
import 'package:app_filmes_teste_api/interactor/bloc/movie/movie_bloc.dart';
import 'package:app_filmes_teste_api/interactor/entities/genre_entity.dart';
import 'package:app_filmes_teste_api/interactor/entities/movie_entity.dart';
import 'package:app_filmes_teste_api/presenter/nav/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMoviesHomeMolecule extends StatefulWidget {
  final List<GenreEntity> genres;
  const ListMoviesHomeMolecule({
    super.key,
    required this.genres,
  });

  @override
  State<ListMoviesHomeMolecule> createState() => _ListMoviesHomeMoleculeState();
}

class _ListMoviesHomeMoleculeState extends State<ListMoviesHomeMolecule> {
  late List<GenreEntity> _genres;
  late MovieBloc _blocMovie;

  @override
  void initState() {
    _blocMovie = context.read<MovieBloc>();

    _genres = widget.genres;
    final List<int> list = [];
    for (var element in _genres) {
      list.add(element.id);
    }
    _blocMovie.add(GetHomePageMovies(id: list));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _genres.length > 5 ? 6 : _genres.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 5) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                    ),
                    height: 100,
                    child: InkWell(
                      onTap: () => goTopageNamed(context: context, name: 'allgenres'),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            'Mais generos',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                final genre = _genres[index];
                final movies = _blocMovie.movieHomePage.where((element) => element.genreID.contains(genre.id));

                return Column(
                  children: [
                    Container(
                      height: 400,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  genre.name,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                InkWell(
                                  onTap: () => goTopageNamed(context: context, name: 'movielist', params: {'id': genre.id.toString()}),
                                  child: const Text('Ver mais'),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(
                              color: Colors.grey[900],
                              height: 3,
                              thickness: 5,
                            ),
                            Expanded(
                              child: BlocBuilder<MovieBloc, MovieState>(
                                builder: (context, state) {
                                  if (state is InitialMovieLoad || state is MovieLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, idx) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: InkWell(
                                          onTap: () {
                                            _showModalDialog(context, movies, idx);
                                          },
                                          child: Image.network(
                                            Constants.baseURLImage + (idx < movies.length ? movies.elementAt(idx).posterPath : ''),
                                            width: 200,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }

  _showModalDialog(BuildContext context, Iterable<MovieEntity> movies, idx) {
    showModalBottomSheet(
        context: context,
        builder: (
          context,
        ) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[900]),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.grey[800]),
                child: Row(
                  children: [
                    Column(
                      children: [Image.network(Constants.baseURLImage + movies.elementAt(idx).posterPath, height: 200)],
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            movies.elementAt(idx).title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 15),
                          Divider(
                            color: Colors.grey[900],
                            height: 1,
                            thickness: 5,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(child: Text(movies.elementAt(idx).overView, style: const TextStyle(fontSize: 12))),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () =>
                                    goTopageNamed(context: context, name: 'moviedetail', params: {'id': movies.elementAt(idx).id.toString()}),
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Saiba mais',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
