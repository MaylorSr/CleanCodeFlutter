import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/domain/entities/chuck_norries_entity.dart';
import 'package:dartz/dartz.dart';

//* Se crean clases abstractas con sus referencias, nunca son impl
abstract class ChuckNorriesRepository {
  //* Enviamos el Either, Un fallo de lado izquierdo o el rigth para mandar la entidad, siempre se debe de mandar la entidad.
  Future<Either<Failure, ChuckNorriesEntity>> getChuckNorries();
}
