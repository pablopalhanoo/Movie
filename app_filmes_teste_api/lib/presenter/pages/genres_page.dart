import 'package:app_filmes_teste_api/presenter/ui/atoms/gridview_genres_atom.dart';
import 'package:app_filmes_teste_api/presenter/ui/templates/scaffold_tamplate.dart';
import 'package:flutter/material.dart';

class GenresPage extends StatelessWidget {
  const GenresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldTamplate(
      useAppBar: true,
      useMenu: true,
      useSearch: true,
      showLogo: true,
      body: GridViewGenresAtom(),
    );
  }
}
