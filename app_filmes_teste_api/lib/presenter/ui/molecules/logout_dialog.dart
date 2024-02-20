import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutDialogAtom extends StatelessWidget {
  const LogoutDialogAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 1,
      backgroundColor: Colors.grey[800],
      title: const Text(
        'ATENÇÃO',
        style: TextStyle(fontSize: 18, color: Colors.red),
      ),
      content: const Text(
        'Quer realmente sair?',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => context.pop(),
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              context.pop();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text(
              'Sair',
              style: TextStyle(color: Colors.red),
            )),
      ],
    );
  }
}
