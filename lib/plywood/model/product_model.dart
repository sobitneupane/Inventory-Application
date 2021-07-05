class Thickness {
  final int id;
  final String productName;
  final String imageUrl;

  Thickness({this.id, this.productName, this.imageUrl});

  factory Thickness.fromJson(Map<String, dynamic> json) {
    return Thickness(
      id: json['id'] as int,
      productName: json['name'] as String,
      imageUrl: json['image'] as String,
    );
  }
}

class DisplayPlyWood {
  final int id;
  final String thickness;
  final String size;
  final int quantity;
  final double price;
  final String godown;
  final String thicknessName;
  final String godownName;
  final String sizeName;

  DisplayPlyWood({this.id,this.thickness,this.size,this.quantity,this.price,this.godown,this.thicknessName,this.godownName,this.sizeName});

  factory DisplayPlyWood.fromJson(Map<String,dynamic> json) {
    return DisplayPlyWood(
      id: json['id'] as int,
      thickness: json['thickness'] as String,
      size: json['size'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as double,
      godown: json['godown'] as String,
      thicknessName: json['thickness_name'] as String,
      godownName: json['godown_name'] as String,
      sizeName: json['size_name'] as String
    );
  }

}