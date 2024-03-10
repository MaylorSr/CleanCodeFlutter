import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core.dart';

//* Llamamos a estos metodos para navegar, de manera que si queremos cambiar la forma de navegación de go o push, no supondrá problema.
class NavigationRouter {
  final BuildContext context;

  NavigationRouter({required this.context});

  void goToRickyMory() {
    GoRouter.of(context).go(goRickyMorty);
  }

  void goToChuckNorris() {
    GoRouter.of(context).go(goChuckNorris);
  }
}
