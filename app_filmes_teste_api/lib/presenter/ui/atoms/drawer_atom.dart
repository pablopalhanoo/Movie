import 'package:app_filmes_teste_api/interactor/bloc/genre/genre_bloc.dart';
import 'package:app_filmes_teste_api/presenter/nav/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerAtom extends StatelessWidget {
  const DrawerAtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[800],
      child: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
              child: const Text(
                'MENU',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: false,
                itemCount: context.read<GenreBloc>().genre.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  final Genre = context.read<GenreBloc>().genre[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(Genre.name, style: const TextStyle(color: Colors.white)),
                        onTap: () => goTopageNamed(context: context, name: 'movielist', params: {'id': Genre.id.toString()}),
                      ),
                      Divider(
                        color: Colors.grey[900],
                        height: 1,
                        thickness: 2,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
