import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_text_style.dart';
import 'package:flutter/material.dart';

class UxBfDropdown extends StatelessWidget {

  final List<String> items;
  final String label;
  final String? value;
  final String? hintText;
  final Function(String? value) onChanged;

  const UxBfDropdown({
    required this.items,
    required this.label,
    required this.onChanged,
    super.key,
    this.value,
    this.hintText,
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
        DropdownButtonFormField(
          value: value,
          style: UxBfTextStyle.body16RegularReboto.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          isExpanded: true,
          isDense: true,
          hint: Text(hintText ?? ''),
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
            hintStyle: const TextStyle(color: Colors.grey,),
          ),
          icon: const Icon(Icons.keyboard_arrow_down),
          // Array list of items
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: onChanged
        ),
      ],
    );
  }
}
