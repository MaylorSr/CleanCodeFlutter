import 'package:clean_arquitecture_solid/core/core.dart';
import 'package:clean_arquitecture_solid/features/RickyMorty/domain/entities/ricky_morty.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../RickyMorty.dart';

part 'ricky_morty_event.dart';
part 'ricky_morty_state.dart';

class RickyMortyBloc extends Bloc<RickyMortyEvent, RickyMortyState> {
  //* El bloc siempre va a necesitar un caso de uso, el cual es pasado por la inyección de dependencias en este caso.
  final GetListCharacther useCase;

  RickyMortyBloc({required this.useCase}) : super(RickyMortyState.initS()) {
    on<RickyMortyEvent>(_getListCharacther);
  }

  Future<void> _getListCharacther(
      RickyMortyEvent event, Emitter<RickyMortyState> emitter) async {
    emitter(
      state.copyWith(
        state: GenericState.loading,
      ),
    );

    final result = await useCase(
        NoParams()); // Llamando al caso de uso para que nos diga que pasa.

    //* Le preguntamos al caso de uso de que tipo el la respuesta, right del objeto o left es un fallo
    result.fold(
      (failure) {
        // Manejar el fallo
        emitter(
          RickyMortyState(
              state: GenericState.failure,
              results: state.results.isNotEmpty ? state.results : [],
              errMessage: failure.errMessage),
        );
      },
      (episodes) {
        // Manejar el éxito
        emitter(
          RickyMortyState(
            state: GenericState.load,
            results: episodes,
            errMessage: '',
          ),
        );
      },
    );
  }
}
