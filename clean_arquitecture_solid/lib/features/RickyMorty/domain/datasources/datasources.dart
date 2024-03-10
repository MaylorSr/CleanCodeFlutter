//* Clases abstractas que no implementas, solo realizan la referencias, siempre!!!
import 'package:clean_arquitecture_solid/features/RickyMorty/domain/entities/ricky_morty.dart';

abstract class RickyMortyDataSources {

  Future<List<RickyMortyEntity>> getEpisodes();


  Future<List<RickyMortyEntity>> getCharacther();

}