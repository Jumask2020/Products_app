import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/signup',
        (route) => false,
      );
    });
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        // color: Colors.,
        child: Center(child: Image.asset('assets/image/logo.png')),
      ),
    );
  }
}
