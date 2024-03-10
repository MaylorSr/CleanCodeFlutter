import 'package:clean_arquitecture_solid/features/ChuckNorries/data/model/chuck_norries_response.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/domain/entities/chuck_norries_entity.dart';

class ChuckNorriesMapper {
  static ChuckNorriesEntity getChuckNorries(
      {required ChuckNorriesResponse res}) {
    return ChuckNorriesEntity(id: res.id, value: res.value, url: res.url);
  }
}
