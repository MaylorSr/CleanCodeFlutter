//* Lo que nos envía la petición.

class ChuckNorriesResponse {
    final List<dynamic> categories;
    final DateTime createdAt;
    final String iconUrl;
    final String id;
    final DateTime updatedAt;
    final String url;
    final String value;

    ChuckNorriesResponse({
        required this.categories,
        required this.createdAt,
        required this.iconUrl,
        required this.id,
        required this.updatedAt,
        required this.url,
        required this.value,
    });

    factory ChuckNorriesResponse.fromJson(Map<String, dynamic> json) => ChuckNorriesResponse(
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        iconUrl: json["icon_url"],
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "icon_url": iconUrl,
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
        "value": value,
    };
}
