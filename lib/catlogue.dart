// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CatalogueModels {
  static List<ITEM>? item = [];

  //Get Item by ID
  ITEM getById(int id) =>
      // ignore: null_closures
      item!.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by Position
  ITEM getByPosition(int pos) => item![pos];
}

// ignore: non_constant_identifier_names
Item(
    {required int id,
    required String name,
    required String desc,
    required int price,
    required String color,
    required String image}) {}
// ignore: non_constant_identifier_names

class ITEM {
  int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  ITEM({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  factory ITEM.fromMap(Map<String, dynamic> map) {
    return ITEM(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());

  factory ITEM.fromJson(String source) =>
      ITEM.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ITEM(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant ITEM other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
