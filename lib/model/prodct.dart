class Product {
  late String name, description;
  late int id;
  late var price;
  late List<String> images;
  bool isFav = false;
  int _qty = 1;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
  });

  set qty(int qty) {
    if (qty < 1) {
      _qty = 1;
    }
    _qty = qty;
  }

  int get qty => _qty;

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['title'];
    description = map['description'];
    price = map['price'];
    images = map['images'];
  }
}
