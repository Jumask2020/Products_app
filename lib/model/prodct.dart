class Product {
  late String name, description;
  late int id;
  late int price;
  late List<String> images;
  bool isFav = false;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
  });

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['title'];
    description = map['description'];
    price = map['price'];
    images = map['images'];
  }
}
