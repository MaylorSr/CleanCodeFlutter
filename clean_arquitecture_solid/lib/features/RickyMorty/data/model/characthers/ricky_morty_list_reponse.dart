import 'ricky_morty_response.dart';

class RickyMortyListResponse {
  final Info info;
  final List<RickyMortyResponse> results;

  RickyMortyListResponse({
    required this.info,
    required this.results,
  });

  factory RickyMortyListResponse.fromJson(Map<String, dynamic> json) =>
      RickyMortyListResponse(
        info: Info.fromJson(json["info"]),
        results:
            List<RickyMortyResponse>.from(json["results"].map((x) => RickyMortyResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
