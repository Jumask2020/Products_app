class Category {
  late int id;
  late String name;
  late String image;

  Category({required this.id, required this.name, required this.image});

  Category.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
  }
}
