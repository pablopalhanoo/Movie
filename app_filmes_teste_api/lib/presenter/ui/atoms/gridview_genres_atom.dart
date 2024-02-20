import 'package:app_filmes_teste_api/interactor/bloc/genre/genre_bloc.dart';
import 'package:app_filmes_teste_api/presenter/nav/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridViewGenresAtom extends StatelessWidget {
  const GridViewGenresAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: context.read<GenreBloc>().genre.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        final Genre = context.read<GenreBloc>().genre[index];
        return GestureDetector(
          onTap: () => goTopageNamed(context: context, name: 'movielist', params: {'id': Genre.id.toString()}),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.grey[900]),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.grey[800]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Genre.name,
                    style: const TextStyle(fontSize: 18, color: Colors.white, decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
