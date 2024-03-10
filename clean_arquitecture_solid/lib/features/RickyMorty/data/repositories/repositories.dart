
import 'package:clean_arquitecture_solid/features/RickyMorty/domain/repositories/repositories.dart';

import '../../domain/entities/ricky_morty.dart';
import '../datasources/datasources.dart';

class RickyMortyRepositorie extends RickyMortyRepositories {
  final RickyMortyDataSource dataSource;

  RickyMortyRepositorie({required this.dataSource});

  @override
  Future<List<RickyMortyEntity>> getEpisodes() async {
    return dataSource.getEpisodes();
  }

  @override
  Future<List<RickyMortyEntity>> getCharacther() {
    return dataSource.getCharacther();
  }
}
