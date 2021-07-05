class OtherProducts {
  final int id;
  final String productName;
  final String imageUrl;

  OtherProducts({this.id, this.productName, this.imageUrl});

  factory OtherProducts.fromJson(Map<String, dynamic> json) {
    return OtherProducts(
      id: json['id'] as int,
      productName: json['name'] as String,
      imageUrl: json['image'] as String,
    );
  }
}