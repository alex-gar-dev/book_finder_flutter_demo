import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_text_style.dart';
import 'package:flutter/material.dart';

class UxBfVendor extends StatelessWidget {

  final String name;
  final String occupation;
  final String image;

  const UxBfVendor({
    required this.name,
    required this.occupation,
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/$image'),
          radius: 70
        ),
        Text(name, style: UxBfTextStyle.body16RegularReboto.copyWith(
          fontWeight: FontWeight.bold
        )),
        Text(occupation, style: UxBfTextStyle.body16RegularReboto.copyWith(
          color: UxBfColorsPallete.gray500
        )),
      ],
    );
  }
}