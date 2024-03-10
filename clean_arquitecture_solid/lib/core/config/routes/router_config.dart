import 'package:clean_arquitecture_solid/features/ChuckNorries/ChuckNorries.dart';
import 'package:clean_arquitecture_solid/features/RickyMorty/RickyMorty.dart';
import 'package:go_router/go_router.dart';

import '../../core.dart';

//* Encargado de que Page / Screen se muestra dependiendo de la ruta a la cual vamos a acceder.
final routerConfig = GoRouter(
  initialLocation: home,
  routes: [
    GoRoute(
      //* Referencia al nombre
      path: home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: rickyMorty,
          builder: (context, state) => const RickyMortyScreen(),
        ),
        GoRoute(
          path: chuckNorris,
          builder: (context, state) => const ChuckNorriesScren(),
        ),
      ],
    ),
  ],
);
