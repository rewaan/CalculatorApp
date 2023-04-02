import 'package:flutter/material.dart';

import 'calculator.dart';

void main() => runApp(const MyApp());

/// Main App class.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Calculator",
      home: Home(),
    );
  }
}

/// Home screen.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalculatorApp'),
        centerTitle: true,
      ),
      body: const Calculator(),
      backgroundColor: Colors.white60,
    );
  }
}