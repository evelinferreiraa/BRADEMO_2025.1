/*2. Você sabia que o FloatingActionButton (também
conhecido como FAB) pode ser posicionado ao meio
de um BottomBarNavigation?
Verifique que ao selecionar o FAB, novas opções são
apresentadas. Implemente também esse recurso. */

import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomAppBar with FAB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade50,
      ),
      home: HomePage(),
    );
  }
}
