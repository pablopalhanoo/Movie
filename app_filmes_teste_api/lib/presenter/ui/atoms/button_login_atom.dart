import 'package:app_filmes_teste_api/presenter/nav/routes.dart';
import 'package:flutter/material.dart';

class ButtonLoginAtom extends StatelessWidget {
  const ButtonLoginAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 50,
      child: TextButton(
        onPressed: () => goTopageNamed(context: context, name: 'homepage'),
        style: TextButton.styleFrom(backgroundColor: Colors.grey[800], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        child: const Text(
          'LOGIN',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
