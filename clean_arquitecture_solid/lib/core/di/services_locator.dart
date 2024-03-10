import 'package:clean_arquitecture_solid/features/ChuckNorries/ChuckNorries.dart';
import 'package:clean_arquitecture_solid/features/RickyMorty/RickyMorty.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

GetIt getIt = GetIt.instance;

void serviceLocator() {
  //* Http se debe inicializar para poder usar sus peticiones
  getIt.registerFactory(() => http.Client());

  //* ChuckNorris locator

  // Registra tu fuente de datos como Lazy Singleton
  getIt.registerLazySingleton(
    () => ChuckNorriesDataSourceImpl(
      httpClient: getIt<http.Client>(),
    ),
  );

  // Registra tu repositorio como Lazy Singleton
  getIt.registerLazySingleton<ChuckNorriesRepository>(
    () => ChuckNorriesRepositoryImpl(
      dataSources: getIt<ChuckNorriesDataSourceImpl>(),
    ),
  );

  // Registra tu caso de uso como Factory
  getIt.registerLazySingleton<GetChuckNorries>(
    () => GetChuckNorries(
      repository: getIt<ChuckNorriesRepository>(),
    ),
  );

  // Registra tu Bloc como Factory
  getIt.registerFactory<ChuckNorriesBloc>(
    () => ChuckNorriesBloc(
      getChuckNorries: getIt<GetChuckNorries>(),
    ),
  );

  //* DIO
  // Registra tu fuente de datos como Lazy Singleton
  getIt.registerLazySingleton(() => RickyMortyDataSource());

  // Registra tu repositorio como Lazy Singleton
  getIt.registerLazySingleton<RickyMortyRepositories>(
    () => RickyMortyRepositorie(
      dataSource: getIt<RickyMortyDataSource>(),
    ),
  );

  // Registra tu caso de uso como Factory
  getIt.registerLazySingleton<GetListCharacther>(
    () => GetListCharacther(
      getIt<RickyMortyRepositories>(),
    ),
  );

  // Registra tu Bloc como Factory
  getIt.registerFactory<RickyMortyBloc>(
    () => RickyMortyBloc(
      useCase: getIt<GetListCharacther>(),
    ),
  );
}
