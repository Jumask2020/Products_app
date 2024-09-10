import 'package:flutter/material.dart';
import 'package:product_app/view/favorite_screen.dart';
import 'package:product_app/view/product_cart.dart';
import 'package:product_app/view/product_view.dart';

import '../viewmodel/product_vm.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    const ProductView(),
    const FavoriteScreen(),
    const ProductCart(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   splashColor: Colors.amber,
      //   shape: const CircleBorder(),
      //   backgroundColor: Colors.teal,
      //   child: const Icon(
      //     Icons.home,
      //     color: Colors.white,
      //     // size: 30,
      //   ),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          elevation: 12,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          backgroundColor: Colors.grey[200],
          currentIndex: index,
          selectedItemColor: Colors.indigo[800],
          onTap: (val) {
            index = val;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          ]),
      body: screens.elementAt(index),
    );
  }
}
