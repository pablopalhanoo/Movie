import 'package:app_filmes_teste_api/interactor/bloc/genre/genre_bloc.dart';
import 'package:app_filmes_teste_api/presenter/ui/molecules/list_movies_home_molecule.dart';
import 'package:app_filmes_teste_api/presenter/ui/templates/scaffold_tamplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GenreBloc _blocgenrer;

  @override
  void initState() {
    _blocgenrer = context.read<GenreBloc>();
    _blocgenrer.add(const InitialGenreLoad());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTamplate(
      useAppBar: true,
      showLogo: true,
      useMenu: true,
      useSearch: true,
      body: BlocBuilder<GenreBloc, GenreState>(
        builder: (context, state) {
          if (state is InitialGenreLoad || state is GenreLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListMoviesHomeMolecule(genres: _blocgenrer.genre),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
