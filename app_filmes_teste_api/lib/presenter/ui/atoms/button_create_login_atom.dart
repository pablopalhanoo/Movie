import 'package:flutter/material.dart';

class ButtonCreateLoginAtom extends StatelessWidget {
  final VoidCallback? onPressed;
  const ButtonCreateLoginAtom({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 450,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        color: Colors.grey[900],
      ),
      child: TextButton(
          onPressed: onPressed,
          child: const Text(
            'CRIAR CONTA',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
