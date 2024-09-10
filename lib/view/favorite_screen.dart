import 'package:flutter/material.dart';
import 'package:product_app/model/prodct.dart';

import 'package:product_app/viewmodel/product_vm.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<Product> fav;
  @override
  void initState() {
    fav = ProductVm.favorite;
    super.initState();
  }

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
                    itemCount: fav.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            // childAspectRatio:/
                            childAspectRatio: 2 / 3,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/productDetalis',
                              arguments: fav[index],
                            );
                          },
                          child: Card(
                            elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    const Spacer(),
                                    Container(
                                      height: 180,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                fav[index].images[0]),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                    Positioned(
                                        top: -6,
                                        right: -4,
                                        child: IconButton(
                                            onPressed: () {
                                              ProductVm.favorite
                                                  .remove(fav[index]);
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              fav[index].isFav
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: Colors.red,
                                            )))
                                  ],
                                ),
                                // const Spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ProductVm.favorite[index].name,
                                        // overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '\$ ${ProductVm.favorite[index].price}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))));
  }
}
