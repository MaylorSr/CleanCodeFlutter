import 'ricky_morty.dart';

class RickyMortyEntityResponse {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;
  final List<RickyMortyEntity> results;

  RickyMortyEntityResponse({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
    required this.results,
  });
}
