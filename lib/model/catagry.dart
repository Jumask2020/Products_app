class Catagry {
  late String name, image;
  late int id;
  Catagry({required this.id, required this.name, required this.image});

  Catagry.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    image = map['image'];
  }
}
