import 'package:book_finder_flutter_demo/ux/atoms/ux_bf_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UxBfInputDate extends StatelessWidget {

  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  
  const UxBfInputDate({
    required this.label,
    super.key,
    this.controller,
    this.hintText,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return UxBfInput(
      label: label,
      controller: controller,
      keyboardType: TextInputType.number,
      hintText: hintText,
      validator: validator,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DateTextInputFormatter(),
        LengthLimitingTextInputFormatter(10)
      ],
    );
  }
}

class DateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Eliminar cualquier carácter que no sea un dígito
    final text = newValue.text;
    final newText = StringBuffer();

    // Añadir las barras en las posiciones adecuadas
    for (int i = 0; i < text.length; i++) {
      if (i == 2 || i == 4) {
        newText.write('/');
      }
      newText.write(text[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}