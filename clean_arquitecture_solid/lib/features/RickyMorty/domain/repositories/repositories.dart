import 'package:clean_arquitecture_solid/features/RickyMorty/domain/entities/ricky_morty.dart';


abstract class RickyMortyRepositories {
  Future<List<RickyMortyEntity>> getEpisodes();
  Future<List<RickyMortyEntity>> getCharacther();

}
