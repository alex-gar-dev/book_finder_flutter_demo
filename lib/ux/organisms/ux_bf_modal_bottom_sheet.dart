import 'package:book_finder_flutter_demo/ux/atoms/ux_bf_button_icon.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_text_style.dart';
import 'package:flutter/material.dart';

class UxBfModalBottomSheet {
  static showBottomModalBook({
    required BuildContext context,
    required String image,
    required String title,
    required String description,
    void Function()? onPressed
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 40
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.minimize_outlined,
                color: UxBfColorsPallete.gray500,
                size: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20)
                  )
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20
                ),
                height: 340,
                width: 500,
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  title,
                  style: UxBfTextStyle.body16RegularReboto.copyWith(
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  description,
                  style: UxBfTextStyle.body16RegularReboto.copyWith(
                    color: UxBfColorsPallete.gray500,
                  )
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 30
                ),
                child: UxBfButtonIcon(
                  label: 'Add to favorites',
                  onPressed: onPressed
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}