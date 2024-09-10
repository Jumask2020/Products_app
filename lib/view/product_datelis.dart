import 'package:flutter/material.dart';
import 'package:product_app/model/prodct.dart';
import 'package:product_app/viewmodel/product_vm.dart';

class ProductDatelis extends StatefulWidget {
  const ProductDatelis({super.key});

  @override
  State<ProductDatelis> createState() => _ProductDatelisState();
}

class _ProductDatelisState extends State<ProductDatelis> {
  

  @override
  Widget build(BuildContext context) {
    Product p = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(ProductVm.cart.length);
            },
            child: const Icon(Icons.arrow_back)),

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/productCart');
              },
              child: Badge(
                label: Text('${ProductVm.cart.length}'),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
        title: Text(p.name),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ProductVm.addCart(p: p);
          
          setState(() {});
        },
        child: const Icon(Icons.shopping_cart),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      p.images[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: p.images.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              String url = p.images[0];
                              p.images[0] = p.images[index];
                              p.images[index] = url;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 8),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(p.images[index]))),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 70,
                    child: Text(
                      p.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Text('\$${p.price}',
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                p.description,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
