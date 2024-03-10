import 'package:clean_arquitecture_solid/features/RickyMorty/domain/entities/ricky_morty.dart';

import '../data.dart';

class RickyMortyMappers {
  static RickyMortyEntity jsonToEntity({required RickyMortyResponse response}) {
    return RickyMortyEntity(
      id: response.id,
      name: response.name,
      url: response.image,
    );
  }
}
