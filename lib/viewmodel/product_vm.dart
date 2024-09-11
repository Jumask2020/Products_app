import 'package:product_app/data/product_db.dart';
import 'package:product_app/model/catagry.dart';
import 'package:product_app/model/prodct.dart';

class ProductVm {
  // static List<Map<Product, int>> cart = [];
  static List<Product> cart = [];
  static List<Product> favorite = [];
  // List<Catagry> catagry = [];

  ProductDb db = ProductDb();
  List<Product> fetchAllProduct() {
    return db.fetchProduct().map((e) => Product.fromMap(e)).toList();
  }

  List<Product> filtterProduct(int id) {
    return db
        .fetchProduct()
        .where((e) => e['category']['id'] == id)
        .toList()
        .map((p) => Product.fromMap(p))
        .toList();
  }

  List<Category> fetchAllCatary() {
    List<Map<String, dynamic>> uniqueItems = [];
    Set<int> itemIds = {};

    for (var item in db.fetchCatagry()) {
      if (!itemIds.contains(item['id'])) {
        itemIds.add(item['id']);
        uniqueItems.add(item);
      }
    }

    return uniqueItems.map((e) => Category.fromMap(e)).toList();
  }

  static List<Product> addCart({required Product p}) {
    if (cart.contains(p)) {
      p.qty++;
    } else {
      cart.add(p);
    }
    return cart;
  }

  static List<Product> favoriteProductS(
      {required Product p, required bool isFavorite}) {
    if (isFavorite) {
      favorite.add(p);
    } else {
      favorite.remove(p);
    }

    return favorite;
  }
}
