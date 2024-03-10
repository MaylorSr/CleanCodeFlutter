part of 'ricky_morty_bloc.dart';

class RickyMortyState extends Equatable {
  final GenericState state;

  final String errMessage;

  final List<RickyMortyEntity> results;

  const RickyMortyState(
      {required this.state, required this.results, required this.errMessage});

  static RickyMortyState initS() {
    return const RickyMortyState(
        state: GenericState.initial, results: [], errMessage: '');
  }

  copyWith(
      {GenericState? state, List<RickyMortyEntity>? results, String? errMessage}) {
    return RickyMortyState(
        state: state ?? this.state,
        results: results ?? this.results,
        errMessage: errMessage ?? this.errMessage);
  }

  @override
  List<Object> get props => [state, errMessage, results];
}
