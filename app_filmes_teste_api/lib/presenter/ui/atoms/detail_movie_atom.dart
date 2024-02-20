import 'package:app_filmes_teste_api/data/clients/api_client_endpoints.dart';
import 'package:app_filmes_teste_api/data/repositories/movie_detail_repository.dart';
import 'package:app_filmes_teste_api/interactor/entities/movie_detail_entity.dart';
import 'package:flutter/material.dart';

class DetailMovieAtom extends StatefulWidget {
  final int id;
  final MovieDetailEntity? movie;
  const DetailMovieAtom({
    super.key,
    required this.id,
    required this.movie,
  });

  @override
  State<DetailMovieAtom> createState() => _DetailMovieAtomState();
}

class _DetailMovieAtomState extends State<DetailMovieAtom> {
  final MovieDetailApiRepository repository = MovieDetailApiRepository();
  late MovieDetailEntity? movie;

  @override
  void initState() {
    movie = widget.movie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.grey[900]),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.grey[800]),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(Constants.baseURLImage + widget.movie!.posterPath),
                Positioned(
                  right: 0,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/estrela.png',
                        height: 73,
                      ),
                      Positioned.fill(
                        child: Center(
                            child: Text(
                          movie!.vote.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Text(
              widget.movie!.title,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 15),
            Divider(
              color: Colors.grey[900],
              height: 1,
              thickness: 5,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Text('Descrição: ${movie!.overView}'),
                )
              ],
            ),
            const SizedBox(height: 15),
            Divider(
              color: Colors.grey[900],
              height: 1,
              thickness: 5,
            ),
            const SizedBox(height: 15),
            Column(
              children: [Text('Tempo de duração: ${movie!.runTime}min')],
            ),
            const SizedBox(height: 15),
            Divider(
              color: Colors.grey[900],
              height: 1,
              thickness: 5,
            ),
          ],
        ),
      ),
    );
  }
}
