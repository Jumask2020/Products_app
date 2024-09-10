import 'package:flutter/material.dart';
import 'package:product_app/model/prodct.dart';
import 'package:product_app/viewmodel/cart_vm.dart';
import 'package:product_app/viewmodel/product_vm.dart';
import 'package:product_app/widget/my_buttom.dart';

class ProductCart extends StatefulWidget {
  const ProductCart({super.key});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  CartVm cartVm = CartVm();
  // int i = 1;
  late List<Product> item;
  @override
  void initState() {
    item = ProductVm.cart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Product'),
      ),
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
                    return MyButtom(
                      name: 'Remove',
                      onPressed: () {
                        ProductVm.cart.remove(item[index]);
                        setState(() {});
                      },
                    );
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(item[index].images[0]),
                      title: Text(
                        item[index].name,
                        maxLines: 2,
                      ),
                      subtitle: Row(
                        children: [
                          Text('Qualty : ${item[index].qty}'),
                          Container(
                            margin: const EdgeInsets.only(left: 12, right: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    item[index].qty++;

                                    setState(() {});
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
                                      if (item[index].qty > 1) {
                                        item[index].qty--;
                                      }
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
                      trailing: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              ProductVm.cart.remove(item[index]);
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.indigo[800],
                                  borderRadius: BorderRadius.circular(15)),
                              height: 30,
                              width: 30,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$ ${cartVm.totalProductPrice(item[index].price, item[index].qty)}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
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
