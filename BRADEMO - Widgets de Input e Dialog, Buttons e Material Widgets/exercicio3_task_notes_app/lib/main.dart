/*3. Crie a tela da imagem utilizando como raiz da árvore
de widgets um MaterialApp e Scaffold.
Para criar a lista de tarefas você deve utilizar também o
ListView com o método builder para criar Cards para
mostrar as tarefas. Utilize também CheckBox e
ElevatedButton. Ao clicar no FloatingActionButton, faça
aparecer um AlertDialog que apresente a mensagem
“Você está no App de Notas de Tarefas”.*/

import 'package:flutter/material.dart';
import 'screens/task_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: TaskListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
