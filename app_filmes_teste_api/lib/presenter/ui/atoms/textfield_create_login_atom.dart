import 'package:flutter/material.dart';

class TextFieldCreateLoginAtom extends StatelessWidget {
  const TextFieldCreateLoginAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_2_rounded, color: Colors.white),
                labelText: 'Usuário',
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.grey[800],
                border: const OutlineInputBorder(borderRadius: BorderRadius.horizontal())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock_sharp,
                  color: Colors.white,
                ),
                labelText: 'Senha',
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.grey[800],
                border: const OutlineInputBorder(borderRadius: BorderRadius.horizontal())),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock_sharp,
                  color: Colors.white,
                ),
                labelText: 'Confirmar senha',
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                filled: true,
                fillColor: Colors.grey[800],
                border: const OutlineInputBorder(borderRadius: BorderRadius.horizontal())),
          ),
        ),
      ],
    );
  }
}
