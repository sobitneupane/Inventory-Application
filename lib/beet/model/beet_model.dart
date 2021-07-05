class Beets {
  final int id;
  final String productName;
  final String imageUrl;

  Beets({this.id, this.productName, this.imageUrl});

  factory Beets.fromJson(Map<String, dynamic> json) {
    return Beets(
      id: json['id'] as int,
      productName: json['name'] as String,
      imageUrl: json['image'] as String,
    );
  }
}