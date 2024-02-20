import 'package:app_filmes_teste_api/interactor/bloc/movie/movie_bloc.dart';
import 'package:app_filmes_teste_api/presenter/ui/molecules/movie_genre_list_atom.dart';
import 'package:app_filmes_teste_api/presenter/ui/templates/scaffold_tamplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieGenreListPage extends StatefulWidget {
  final int id;
  const MovieGenreListPage({super.key, required this.id});

  @override
  State<MovieGenreListPage> createState() => _MovieGenreListPageState();
}

class _MovieGenreListPageState extends State<MovieGenreListPage> {
  late MovieBloc _bloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _bloc = context.read<MovieBloc>();
    _bloc.add(InitialMovieLoad(id: [widget.id]));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _bloc.add(GetMoreMovies(id: [widget.id]));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTamplate(
        showLogo: true,
        useAppBar: true,
        useSearch: true,
        useMenu: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  return MovieGenreListAtom(
                    isLoading: state is MovieLoading,
                    movies: _bloc.movie,
                    scrollController: _scrollController,
                    id: [widget.id],
                  );
                },
              ),
            )
          ],
        ));
  }
}
