import 'package:flutter/material.dart';

ElevatedButton buildButton(BuildContext context, String text, Widget page) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      shadowColor: Colors.black54,
      elevation: 5,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.arrow_forward, size: 18),
        const SizedBox(width: 8),
        Text(text),
      ],
    ),
  );
}
