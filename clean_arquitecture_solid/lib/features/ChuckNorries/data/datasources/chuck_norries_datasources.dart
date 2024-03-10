import 'dart:convert';
import 'dart:io';

import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/data/mappers/chuck_norries_mapper.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/data/model/chuck_norries_response.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/domain/entities/chuck_norries_entity.dart';
import 'package:http/http.dart' as http;

import '../../domain/datasources/chuck_norries_datasources.dart';

//* Finalmente llegamos a la clase padre, esta es la que realiza la petición, espera la respuesta y nos envia el error.
class ChuckNorriesDataSourceImpl extends ChuckNorriesDataSource {
  //* Forma para realizar la petición, http.
  final http.Client httpClient;

  ChuckNorriesDataSourceImpl({required this.httpClient});

  @override
  Future<ChuckNorriesEntity> getChuckNorries() async {
    try {
      //* Url a la que se hace la petición
      const String url = 'https://api.chucknorris.io/jokes/random';

      await Future.delayed(const Duration(milliseconds: 300));
      //* Hacemos la petición
      final http.Response response = await httpClient.get(
        Uri.parse(
          url,
        ),
      );
      
      return ChuckNorriesMapper.getChuckNorries(
        res: ChuckNorriesResponse.fromJson(
          jsonDecode(response.body),
        ),
      );
    } on HttpResponse catch (e) {
      if (e.statusCode == 404) {
        throw NotFoundExceptions(
            statusCode: 404, errMessage: 'No se encontraron resultados');
      }

      if (e.statusCode == 400) {
        throw BadRequestException(
            statusCode: 400, errMessage: 'La petición no es válida');
      }
      throw GenericException(
          statusCode: 500, errMessage: 'Error no controlado');
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
