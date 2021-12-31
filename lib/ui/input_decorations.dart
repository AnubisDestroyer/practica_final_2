import 'package:flutter/material.dart';

// Estilo de los campos del formulario (PersonalPage)
class InputDecorations {

  static InputDecoration formInputDecoration({
    required String hintText,
    required String labelText,
    required IconData icon
    }) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      hintText: hintText,
      labelText: labelText,
      );
  }
}