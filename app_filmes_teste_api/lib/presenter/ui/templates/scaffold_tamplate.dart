import 'package:app_filmes_teste_api/presenter/nav/routes.dart';
import 'package:app_filmes_teste_api/presenter/ui/atoms/drawer_atom.dart';
import 'package:app_filmes_teste_api/presenter/ui/atoms/textfield_search_atom.dart';
import 'package:app_filmes_teste_api/presenter/ui/molecules/logout_dialog.dart';
import 'package:flutter/material.dart';

class ScaffoldTamplate extends StatelessWidget {
  final Widget body;
  final bool? showLogo;
  final bool? useAppBar;
  final bool? useSearch;
  final bool? useMenu;
  const ScaffoldTamplate({super.key, required this.body, this.showLogo, this.useAppBar, this.useMenu, this.useSearch});

  @override
  Widget build(BuildContext context) {
    AppBar? getAppbar() {
      return useAppBar != null && useAppBar!
          ? AppBar(
              leadingWidth: 150,
              leading: Builder(builder: (context) {
                return Row(children: [
                  IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                  if (showLogo != null && showLogo!)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () => goTopageNamed(context: context, name: 'homepage'),
                          child: Hero(
                            tag: 'logo-image',
                            child: Image.asset('assets/logo_filmes.png'),
                          ),
                        ),
                      ),
                    )
                ]);
              }),
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              actions: [
                IconButton(
                    onPressed: () {
                      showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return const LogoutDialogAtom();
                          });
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
              ],
            )
          : null;
    }

    return Scaffold(
      appBar: getAppbar(),
      drawer: const Column(
        children: [
          Expanded(child: DrawerAtom()),
        ],
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          if (useSearch != null && useSearch!)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(0)),
                padding: const EdgeInsets.all(8),
                child: const TextFieldSearchAtom(),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: body,
            ),
          )
        ],
      ),
    );
  }
}
