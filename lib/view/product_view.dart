import 'package:flutter/material.dart';
import 'package:product_app/model/catagry.dart';

import 'package:product_app/model/prodct.dart';

import 'package:product_app/viewmodel/product_vm.dart';
import 'package:product_app/widget/my_card_product.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductVm productVm = ProductVm();
  bool isFavorite = false;
  late List<Product> p;
  late List<Category> c;
  @override
  void initState() {
    // TODO: implement initState
    c = productVm.fetchAllCatary();
    p = productVm.fetchAllProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/productCart');
              },
              child: Badge(
                label: Text('${ProductVm.cart.length}'),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 110,
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      p = productVm.fetchAllProduct();
                      setState(() {});
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(left: 10, top: 8, right: 6),
                          height: 63,
                          width: 63,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(158, 158, 158, 1),
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Text(
                              'All',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text('All Product')
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: c.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            p = productVm.filtterProduct(c[index].id);
                            setState(() {});
                          },
                          child: SizedBox(
                            height: 120,
                            width: 100,
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(c[index].image),
                                          fit: BoxFit.fill)),
                                  // child: Text(c[index].image),
                                ),
                                Text(c[index].name)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height - 190,
              height: MediaQuery.of(context).size.height - 249,

              child: Card(
                child: GridView.builder(
                  addAutomaticKeepAlives: false,
                  semanticChildCount: 12,
                  itemCount: p.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      // childAspectRatio:/
                      childAspectRatio: 2 / 3,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return MyCardProduct(
                      p: p,
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
