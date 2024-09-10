import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_app/model/prodct.dart';
import 'package:product_app/viewmodel/product_vm.dart';

class MyCardProduct extends StatefulWidget {
  const MyCardProduct({
    super.key,
    required this.p,
    required this.index,
    // required this.productVm,
  });

  final List<Product> p;
  final int index;
  // final ProductVm productVm;

  @override
  State<MyCardProduct> createState() => _MyCardProductState();
}

class _MyCardProductState extends State<MyCardProduct> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/productDetalis',
          arguments: widget.p[widget.index],
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
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage(widget.p[widget.index].images[0]),
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                    top: -6,
                    right: -4,
                    child: IconButton(
                        onPressed: () {
                          widget.p[widget.index].isFav =
                              !widget.p[widget.index].isFav;
                          ProductVm.favoriteProductS(
                              p: widget.p[widget.index],
                              isFavorite: widget.p[widget.index].isFav);
                          setState(() {});
                        },
                        icon: Icon(
                          widget.p[widget.index].isFav
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        )))
              ],
            ),
            // const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.p[widget.index].name,
                    // overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$ ${widget.p[widget.index].price}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
