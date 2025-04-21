import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ThemeData (Sobrescreve)',
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: Theme(
        data: ThemeData(scaffoldBackgroundColor: Colors.yellow),
        child: Scaffold(
          appBar: AppBar(title: const Text('Tema Sobrescrito')),
          body: const Center(
            child: Text('Background amarelo', style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
