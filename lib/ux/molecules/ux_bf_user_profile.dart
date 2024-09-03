import 'package:book_finder_flutter_demo/ux/utils/ux_bf_colors_pallete.dart';
import 'package:flutter/material.dart';

class UxBfUserProfile extends StatelessWidget {
  
  final String user;
  final String phone;
  final String years;
  final String image;

  const UxBfUserProfile({
    required this.user,
    required this.phone,
    required this.years,
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: UxBfColorsPallete.gray300))),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/$image')
          ),
          title: Text(user),
          trailing: Text('$years years old'),
          subtitle: Text(phone),
        ));
  }
}
