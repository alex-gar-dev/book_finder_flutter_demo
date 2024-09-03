
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_text_style.dart';
import 'package:flutter/material.dart';

class UxBfSectionTitle extends StatelessWidget {

  final String title;
  final String description;

  const UxBfSectionTitle({
    required this.title,
    required this.description,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: UxBfTextStyle.headingH5OpenSans),
        Text(description, style: UxBfTextStyle.body16RegularReboto.copyWith(
          color: UxBfColorsPallete.primaryPurple500,
          decoration: TextDecoration.underline
        )),
      ],
    );
  }
}
