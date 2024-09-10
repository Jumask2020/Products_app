import 'package:flutter/material.dart';
import 'package:product_app/model/prodct.dart';
import 'package:product_app/viewmodel/product_vm.dart';
import 'package:product_app/widget/my_card_product.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });
  // final List<Product> cart;

  // ProductVm productVm = ProductVm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Products'),
        ),
        body: ProductVm.favorite.isEmpty
            ? const Center(
                child: Text('Don\'t miss any favorite products'),
              )
            : Card(
                child: GridView.builder(
                addAutomaticKeepAlives: false,
                semanticChildCount: 12,
                itemCount: ProductVm.favorite.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // childAspectRatio:/
                    childAspectRatio: 2 / 3,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => MyCardProduct(
                  p: ProductVm.favorite,
                  index: index,
                  // productVm: productVm,
                ),
              )));
  }
}
