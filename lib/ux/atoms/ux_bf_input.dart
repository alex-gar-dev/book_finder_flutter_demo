import 'package:book_finder_flutter_demo/ux/index.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UxBfInput extends StatelessWidget {

  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const UxBfInput({
    required this.label,
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.inputFormatters
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label, 
          style: UxBfTextStyle.body16RegularReboto.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold
          )
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          style: UxBfTextStyle.body16RegularReboto.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          decoration: InputDecoration(
            fillColor: UxBfColorsPallete.gray50,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UxBfColorsPallete.gray200, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: UxBfColorsPallete.gray300, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}