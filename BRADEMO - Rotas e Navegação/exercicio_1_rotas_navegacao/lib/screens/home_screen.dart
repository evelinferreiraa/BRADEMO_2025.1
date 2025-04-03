import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dash, o mascote!')),
      body: Center(child: Image.asset("assets/mascotDash.png")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Precisa de ajuda? Entre em contato com o Luiz!'),
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.help, color: Colors.white),
      ),
    );
  }
}
