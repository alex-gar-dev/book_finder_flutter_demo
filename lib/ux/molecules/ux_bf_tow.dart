import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_text_style.dart';
import 'package:flutter/material.dart';

class UxBfTow extends StatelessWidget {

  final String title;
  final String price;
  final String image;

  const UxBfTow({
    required this.title,
    required this.price,
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/$image',
          height: 180,
        ),
        const SizedBox(height: 10),
        Text(title, style: UxBfTextStyle.body16RegularReboto.copyWith(
          fontWeight: FontWeight.bold
        )),
        Text(price, style: UxBfTextStyle.body16RegularReboto.copyWith(
          color: UxBfColorsPallete.primaryPurple500
        )),
      ],
    );
  }
}