import '../entities/chuck_norries_entity.dart';

//* Se crean clases abstractas con sus referencias, nunca son impl
abstract class ChuckNorriesDataSource {
  //* Enviamos el Either, Un fallo de lado izquierdo o el rigth para mandar la entidad, siempre se debe de mandar la entidad.
  Future<ChuckNorriesEntity> getChuckNorries();
}
