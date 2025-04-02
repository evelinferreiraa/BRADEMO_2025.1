/*1. Reproduza em um projeto Flutter a interface gráfica com os widgets organizados como na figura.*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter is NOT Fun!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              width: 100,
              height: 100,
              color: Colors.red,
              child: Text(
                'Hi Luiz 🐣',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
