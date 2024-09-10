import 'package:product_app/model/prodct.dart';

class CartVm {
  
  double totalProductPrice(int price, int qty) {
    return price * qty.toDouble();
  }

  double totalCartPrice(List<Product> cart) {
    double totalPrice = 0.0;
    for (int i = 0; i < cart.length; i++) {
      double total = cart[i].price * cart[i].qty.toDouble();
      totalPrice += total;
    }

    return totalPrice;
  }

  int addQty(int q) {
    return q++;
  }
}
