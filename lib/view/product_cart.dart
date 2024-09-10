import 'package:flutter/material.dart';
import 'package:product_app/viewmodel/cart_vm.dart';
import 'package:product_app/viewmodel/product_vm.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({super.key});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  CartVm cartVm = CartVm();

  // List<Map<Product, int>> cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        // height: MediaQuery.of(context).size.height - 190,
        height: MediaQuery.of(context).size.height - 80,

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 3,
                child: ListView.separated(
                  itemCount: ProductVm.cart.length,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    var item = ProductVm.cart;
                    return ListTile(
                      leading: Image.network(item[index].keys.first.images[0]),
                      title: Text(
                        item[index].keys.first.name,
                        maxLines: 2,
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                              'Qualty : ${item[index].values.first.toString()}'),
                          Container(
                            margin: const EdgeInsets.only(left: 12, right: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cartVm.addQty(item[index].values.first);
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 10,
                                    child: Icon(
                                      Icons.add,
                                      size: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cartVm.addQty(item[index].values.first);
                                    });
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 10,
                                    child: Icon(
                                      Icons.remove,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      trailing: Text('\$ ${item[index].keys.first.price}'),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3 - 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.indigo[800],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Item Count: ${ProductVm.cart.length}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Total Price End : ${cartVm.totalCartPrice(ProductVm.cart)}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      MaterialButton(
                        color: Colors.deepOrange,
                        onPressed: () {
                          Navigator.pushNamed(context, '/order');
                        },
                        child: const Text(
                          'New Order',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
