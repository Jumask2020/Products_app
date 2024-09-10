// class Catagry {
//   late String name, image;
//   late int id;
//   Catagry({required this.id, required this.name, required this.image});

//   Catagry.fromMap(Map<String, dynamic> map) {
//     id = map['id'];
//     name = map['name'];
//     image = map['image'];
//   }
// }
class Category {
  final int id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && runtimeType == other.runtimeType && id == other.id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Category(id: $id, name: $name, image: $image)';
}
