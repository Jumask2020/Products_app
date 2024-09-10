import 'package:flutter/material.dart';

class StatefullScreen extends StatefulWidget {
  const StatefullScreen({super.key});

  @override
  State<StatefullScreen> createState() => _StatefullScreenState();
}

class _StatefullScreenState extends State<StatefullScreen> {
  int n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          n++;
         
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          '$n',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
