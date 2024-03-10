
//* Lo que usaremos en nuestro proyecto...
class ChuckNorriesEntity {
  final String id;
  final String value;
  final String url;

  ChuckNorriesEntity({
    required this.id,
    required this.value,
    required this.url,
  });

  @override
  String toString() => 'ChuckNorriesEntoty(id: $id, value: $value, url: $url)';

  @override
  bool operator ==(covariant ChuckNorriesEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.value == value && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ value.hashCode ^ url.hashCode;
}
