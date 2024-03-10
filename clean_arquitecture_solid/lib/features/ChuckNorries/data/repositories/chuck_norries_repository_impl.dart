import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/data/data.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/domain/entities/chuck_norries_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/domain.dart';

/// Esta es una clase que implementará [ChuckNorriesRepository] es la encargada de regresar un Rigth o un Left con un Failure Exception.
class ChuckNorriesRepositoryImpl extends ChuckNorriesRepository {
  //* El encargado de realizar la petición a la API es... EL DATASOURCES, SIEMPRE!!!

  //! Por tanto necesitamos su declaración...

  final ChuckNorriesDataSourceImpl dataSources;

  ChuckNorriesRepositoryImpl({required this.dataSources});

  @override
  Future<Either<Failure, ChuckNorriesEntity>> getChuckNorries() async {
    //* Llamamos al datasourcesImpl que es el encargado de realizar la petición al backend...
    //! Como el [ChuckNorriesDataSource] no nos regresa un Future<Either<Failure, ChuckNorriesEntoty>> , necesitamos gestionarlo aquí... De manera que es necesario realizarlo en un try.

    try {
      final ChuckNorriesEntity response = await dataSources.getChuckNorries();
      //* Si todo sale bien, mandamos el lado derecho.
      return Right(response);
      //* Si ha habido un fallo, regresamos siempre un left, pero tener en cuenta que desde el dataSources, este nos mandará un Exception, no un Failure.
    } on BadRequestException catch (e) {
      return Left(
        BadRequestFailure(errMessage: e.errMessage),
      );
    } on NotFoundExceptions catch (e) {
      return Left(
        NotFoundFailure(errMessage: e.errMessage),
      );
    } on ConnectionTimeOut catch (e) {
      return Left(
        ConnectionTimeOutFailure(errMessage: e.errMessage),
      );
    } on GenericException catch (e) {
      return Left(
        ServerFailure(errMessage: e.errMessage),
      );
    }
  }
}
