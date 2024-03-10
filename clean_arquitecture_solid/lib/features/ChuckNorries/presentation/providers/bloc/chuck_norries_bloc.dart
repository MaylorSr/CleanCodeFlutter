import 'package:bloc/bloc.dart';
import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/features/ChuckNorries/ChuckNorries.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/chuck_norries_entity.dart';

part 'chuck_norries_event.dart';
part 'chuck_norries_state.dart';

class ChuckNorriesBloc extends Bloc<ChuckNorriesEvent, ChuckNorriesState> {
  final GetChuckNorries getChuckNorries;

  ChuckNorriesBloc({required this.getChuckNorries})
      : super(
          ChuckNorriesState.initS(),
        ) {
    //on<ChuckNorriesEvent>((event, emit) {});
    on<ChuckNorriesEvent>(_chuckNorriesEvent);
  }
  Future<void> _chuckNorriesEvent(
      ChuckNorriesEvent event, Emitter<ChuckNorriesState> emitter) async {
    emitter(
      state.copyWith(
        state: GenericState.loading,
      ),
    );

    final result = await getChuckNorries(
      NoParams(),
    ); // Llamando al caso de uso para que nos diga que pasa.

    //* Le preguntamos al caso de uso de que tipo el la respuesta, right del objeto o left es un fallo
    result.fold(
      (failure) {
        // Manejar el fallo
        emitter(
          ChuckNorriesState(
            GenericState.failure,
            null,
            failure.errMessage,
          ),
        );
      },
      (chuckNorries) {
        // Manejar el éxito
        emitter(
          ChuckNorriesState(
            GenericState.load,
            chuckNorries,
            '',
          ),
        );
      },
    );
  }
}
