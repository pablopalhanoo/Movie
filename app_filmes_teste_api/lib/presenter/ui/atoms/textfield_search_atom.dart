import 'package:flutter/material.dart';

class TextFieldSearchAtom extends StatefulWidget {
  const TextFieldSearchAtom({super.key});

  @override
  State<TextFieldSearchAtom> createState() => _TextFieldSearchAtomState();
}

class _TextFieldSearchAtomState extends State<TextFieldSearchAtom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        labelText: 'Pesquisar',
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.grey[800],
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(),
        ),
      ),
    );
  }
}
