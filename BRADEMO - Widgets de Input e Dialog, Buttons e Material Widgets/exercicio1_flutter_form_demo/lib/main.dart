/*1. Implemente um Form como na imagem abaixo.
Busque mesclar Column com Row para obter o
layout apresentado.
Mostre em um SnackBar os dados inseridos
quando o botão Submit for pressionado.*/

import 'package:flutter/material.dart';
import 'components/text_field_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter Form Demo', home: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void showSnackBar(BuildContext context) {
    final name = nameController.text;
    final phone = phoneController.text;
    final dob = dobController.text;

    final message = 'Name: $name\nPhone: $phone\nDOB: $dob';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 3)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Form Demo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField('Name', Icons.person, nameController),
            buildTextField('Phone', Icons.phone, phoneController),
            buildTextField('Dob', Icons.calendar_today, dobController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => showSnackBar(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
