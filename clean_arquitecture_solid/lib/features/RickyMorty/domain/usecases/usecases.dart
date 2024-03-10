import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/features/RickyMorty/domain/entities/ricky_morty.dart';
import 'package:dartz/dartz.dart';
import '../../RickyMorty.dart';

class GetListCharacther extends UseCase<List<RickyMortyEntity>, NoParams> {
  final RickyMortyRepositories repository;

  GetListCharacther(this.repository);

  @override
  Future<Either<Failure, List<RickyMortyEntity>>> call(NoParams params) async {
    try {
      final episodes = await repository.getCharacther();
      return Right(episodes);
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(errMessage: e.errMessage));
    } on NotFoundExceptions catch (e) {
      return Left(NotFoundFailure(errMessage: e.errMessage));
    } on ConnectionTimeOut catch (e) {
      return Left(ConnectionTimeOutFailure(errMessage: e.errMessage));
    } catch (e) {
      return const Left(ServerFailure(errMessage: 'Server error occurred'));
    }
  }
}
