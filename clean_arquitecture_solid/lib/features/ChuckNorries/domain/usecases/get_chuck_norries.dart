import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/domain/entities/chuck_norries_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/chuck_norries_repository.dart';

class GetChuckNorries extends UseCase<ChuckNorriesEntity, NoParams> {
  //* Llamamos al repo para que este haga su trabajo.
  final ChuckNorriesRepository repository;

  //* Constructor.
  GetChuckNorries({required this.repository});

  @override
  Future<Either<Failure, ChuckNorriesEntity>> call(params) async {
    //* Si vemos, el getChuckNorries es una funcion async. Por ello el await, aparte de que ya regruesará un Future<Either<Failure, dynamic>>
    //* Como mi repositorio no necesita parametros no se lo paso, en caso de necesitar, se lo paso.
    // return await repository.getChuckNorries(params);

    return await repository.getChuckNorries();
  }
}
