import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  const MyButtom({
    super.key,
    required this.name,
    this.onPressed,
  });
  final String name;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 2 / 3,
      onPressed: onPressed,
      color: Colors.indigo[800],
      child: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
