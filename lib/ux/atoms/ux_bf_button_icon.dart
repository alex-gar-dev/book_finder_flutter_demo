import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_text_style.dart';
import 'package:flutter/material.dart';

class UxBfButtonIcon extends StatelessWidget {

  final void Function()? onPressed;
  final String label;
  final double? verticalPadding;

  const UxBfButtonIcon({
    required this.label,
    super.key,
    this.verticalPadding = 14,
    this.onPressed
  });

  const UxBfButtonIcon.small({
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
          vertical: verticalPadding ?? 14,
          horizontal: 14
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Ajusta el BorderRadius aquí
        ),
        backgroundColor: UxBfColorsPallete.primaryPurple500
      ),
      onPressed: onPressed, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label, 
            style: UxBfTextStyle.headingH6OpenSans.copyWith(
              color: UxBfColorsPallete.primaryWhite
            )
          ),
          const SizedBox(width: 10),
          Icon(Icons.favorite, size: 20, color: UxBfColorsPallete.primaryWhite)
        ],
      )
    );
  }
}