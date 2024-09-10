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

  List<Category> fetchAllCatary() {
    List<Category> categories = db
        .fetchProduct()
        .map((item) => item['category'])
        .map((cat) => Category(
              id: cat['id'],
              name: cat['name'],
              image: cat['image'],
            ))
        .toList();

    // إزالة العناصر المكررة
    List<Category> uniqueCategories = categories.toSet().toList();
    return uniqueCategories;
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
