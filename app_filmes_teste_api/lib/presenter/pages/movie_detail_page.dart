import 'package:app_filmes_teste_api/interactor/bloc/movie_detail/movie_datail_bloc.dart';
import 'package:app_filmes_teste_api/presenter/ui/atoms/detail_movie_atom.dart';
import 'package:app_filmes_teste_api/presenter/ui/templates/scaffold_tamplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDatailPage extends StatefulWidget {
  final int id;
  const MovieDatailPage({super.key, required this.id});

  @override
  State<MovieDatailPage> createState() => _MovieDatailPageState();
}

class _MovieDatailPageState extends State<MovieDatailPage> {
  late MovieDatailBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<MovieDatailBloc>();
    _bloc.add(InitialMovieDetailLoad(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTamplate(
      useAppBar: true,
      useMenu: true,
      useSearch: true,
      showLogo: true,
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<MovieDatailBloc, MovieDatailState>(
              builder: (context, state) {
                if (state is MovieDetailLoading || state is MovieDatailInitial) {
                  return Container();
                }
                return SingleChildScrollView(
                  child: DetailMovieAtom(
                    id: widget.id,
                    movie: _bloc.movie,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
