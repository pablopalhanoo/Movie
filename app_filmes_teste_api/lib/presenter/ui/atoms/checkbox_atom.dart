import 'package:flutter/material.dart';

class CheckBoxAtom extends StatefulWidget {
  final String label;
  const CheckBoxAtom({super.key, required this.label});

  @override
  State<CheckBoxAtom> createState() => _CheckBoxAtomState();
}

class _CheckBoxAtomState extends State<CheckBoxAtom> {
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          focusColor: Colors.white,
          hoverColor: Colors.white,
          value: _isCheck,
          onChanged: ((value) {
            setState(() {
              _isCheck = value ?? false;
            });
          }),
        ),
        Text(widget.label)
      ],
    );
  }
}
