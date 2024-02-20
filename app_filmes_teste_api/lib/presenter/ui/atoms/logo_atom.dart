import 'package:flutter/material.dart';

class LogoAtom extends StatelessWidget {
  const LogoAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 400,
      height: 200,
      child: Hero(
        tag: 'logo-image',
        child: Image.asset('assets/logo_filmes.png'),
      ),
    );
  }
}
