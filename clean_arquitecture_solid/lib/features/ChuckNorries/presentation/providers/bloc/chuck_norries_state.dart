// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chuck_norries_bloc.dart';

class ChuckNorriesState extends Equatable {
  final GenericState? state;

  final ChuckNorriesEntity? chuckNorries;

  final String? errorMessage;

  const ChuckNorriesState(
    this.state,
    this.chuckNorries,
    this.errorMessage,
  );

  static initS() {
    return const ChuckNorriesState(
      GenericState.initial,
      null,
      '',
    );
  }

  @override
  List<Object?> get props => [
        state,
        chuckNorries,
        errorMessage,
      ];

  ChuckNorriesState copyWith({
    GenericState? state,
    ChuckNorriesEntity? chuckNorries,
    String? errorMessage,
  }) {
    return ChuckNorriesState(
      state ?? this.state,
      chuckNorries ?? this.chuckNorries,
      errorMessage ?? this.errorMessage,
    );
  }
}
