import 'package:clean_arquitecture_solid/core/config/dio/dio.dart';
import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/features/RickyMorty/domain/entities/ricky_morty.dart';
import '../../RickyMorty.dart';
import 'package:dio/dio.dart';

//! ESTE ES EL QUE REALIZA LA PETICIÓN FINAL
class RickyMortyDataSource extends RickyMortyDataSources {
  late final Dio dio;

  RickyMortyDataSource() : dio = DioRest.dio;

  @override
  Future<List<RickyMortyEntity>> getEpisodes() async {
    try {
      final List<RickyMortyEntity> results = [];
      //* Se realiza la petición.
      // ignore: unused_local_variable
      final response = await dio.get("https://rickandmortyapi.com/api/episode");

      //* Recorrer cada elemetno, añadirlo al mapper y castear a nuestro objeto personalizado.
      /* for (var episodios in response.data['results'] ?? []) {
        //! Tener en cuenta que no es un object, hay que hace el jsonDecode.
        final productResponse = RickyMorty.fromJson(episodios);

        final res = RickyMortyMappers.jsonToEntity(response: productResponse);
        results.add(res);
      } */
      return results;
    } on DioException catch (e) {
      //!Excepciones propias de nosotros
      switch (e.response?.statusCode) {
        case 400:
          throw NotFoundExceptions(statusCode: 400, errMessage: e.message!);
        default:
          throw GenericException(
            statusCode: 500,
            errMessage: 'Error no controlado',
          );
      }
    } catch (e) {
      throw Exception("Excepción no controlada");
    }
  }

  @override
  Future<List<RickyMortyEntity>> getCharacther() async {
    try {
      final response =
          await dio.get("https://rickandmortyapi.com/api/character");

      final RickyMortyListResponse res =
          RickyMortyListResponse.fromJson(response.data);

      final List<RickyMortyEntity> result = [];

      for (var element in res.results) {
        result.add(
          RickyMortyMappers.jsonToEntity(response: element),
        );
      }

      return result;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw NotFoundExceptions(
          statusCode: e.response?.statusCode ?? 404,
          errMessage: 'No se ha encontrado una lista de Ricky Morty',
        );
      }
      if (e.response?.statusCode == 400) {
        throw NotFoundExceptions(
          statusCode: e.response?.statusCode ?? 404,
          errMessage: e.response?.statusMessage ??
              'Como se manda la petición está mal gestionada',
        );
      }

      throw GenericException(
        statusCode: 500,
        errMessage: 'Error no controlado',
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
