import 'package:product_app/model/prodct.dart';

class CartVm {
  double totalCartPrice(List<Map<Product, int>> cart) {
    double totalPrice = 0.0;
    for (var c in cart) {
      double total = 0.0;
      c.forEach((k, v) {
        total = (k.price * v).toDouble();
      });
      totalPrice = totalPrice + total;
    }
    return totalPrice;
  }

  int addQty(int q) {
    return q++;
  }
}
