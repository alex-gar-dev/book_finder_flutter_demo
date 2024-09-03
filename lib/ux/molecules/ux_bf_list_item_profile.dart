import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:book_finder_flutter_demo/ux/utils/ux_bf_text_style.dart';
import 'package:flutter/material.dart';

class UxBfListItemProfile extends StatelessWidget {

  final String titleLabel;
  final IconData leadingIcon;
  final Function()? onTap;

  const UxBfListItemProfile({
    required this.titleLabel,
    required this.leadingIcon,
    super.key,
    this.onTap
  });

  const UxBfListItemProfile.myAccount({
    this.titleLabel = 'My Account',
    this.leadingIcon = Icons.person,
    super.key,
    this.onTap
  });

  const UxBfListItemProfile.helpCenter({
    this.titleLabel = 'Help Center',
    this.leadingIcon = Icons.chat,
    super.key,
    this.onTap
  });

  const UxBfListItemProfile.favorites({
    this.titleLabel = 'My favorites',
    this.leadingIcon = Icons.favorite_sharp,
    super.key,
    this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 20
      ),
      leading: Icon(leadingIcon,
          size: 30, color: UxBfColorsPallete.primaryPurple500),
      title: Text(
        titleLabel,
        style: UxBfTextStyle.body16RegularReboto.copyWith(color: Colors.black),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: UxBfColorsPallete.gray300,
      ),
      onTap: onTap,
    );
  }
}
