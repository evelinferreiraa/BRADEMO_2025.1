import 'package:flutter/material.dart';

Widget buildTextField(
  String hintText,
  IconData icon,
  TextEditingController controller,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border:
                  const UnderlineInputBorder(),
            ),
          ),
        ),
      ],
    ),
  );
}
