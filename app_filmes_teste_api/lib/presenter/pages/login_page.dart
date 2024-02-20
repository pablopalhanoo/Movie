import 'package:app_filmes_teste_api/presenter/nav/routes.dart';
import 'package:app_filmes_teste_api/presenter/ui/atoms/button_login_atom.dart';
import 'package:app_filmes_teste_api/presenter/ui/atoms/button_create_login_atom.dart';
import 'package:app_filmes_teste_api/presenter/ui/atoms/checkbox_atom.dart';
import 'package:app_filmes_teste_api/presenter/ui/atoms/logo_atom.dart';
import 'package:app_filmes_teste_api/presenter/ui/atoms/textfield_login_atom.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoAtom(),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.grey[900],
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFieldLoginAtom(),
                    ),
                    ButtonLoginAtom(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckBoxAtom(label: 'Manter logado'),
                        InkWell(
                          child: Text('Esqueceu a senha?'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            ButtonCreateLoginAtom(
              onPressed: () => goTopageNamed(context: context, name: 'createloginpage'),
            )
          ],
        ),
      ),
    ));
  }
}
