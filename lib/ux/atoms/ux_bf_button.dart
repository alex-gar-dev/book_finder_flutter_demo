import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_text_style.dart';
import 'package:flutter/material.dart';

class UxBfButton extends StatelessWidget {

  final void Function()? onPressed;
  final String label;
  final double? verticalPadding;

  const UxBfButton({
    required this.label,
    super.key,
    this.verticalPadding = 14,
    this.onPressed
  });

  const UxBfButton.small({
    required this.label,
    super.key,
    this.verticalPadding = 8,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 14
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Ajusta el BorderRadius aquí
        ),
        backgroundColor: UxBfColorsPallete.primaryPurple500
      ),
      onPressed: onPressed, 
      child: Text(
        label, 
        style: UxBfTextStyle.headingH6OpenSans.copyWith(
          color: UxBfColorsPallete.primaryWhite
        )
      )
    );
  }
}