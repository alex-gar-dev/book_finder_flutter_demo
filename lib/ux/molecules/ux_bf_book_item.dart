import 'package:book_finder_flutter_demo/ux/index.dart';
import 'package:flutter/material.dart';

class UxBfBookItem extends StatelessWidget {

  final String title;
  final String subtitle;
  final String imageNetwork;
  final void Function()? onTap;

  const UxBfBookItem({
    required this.title,
    required this.subtitle,
    required this.imageNetwork,
    super.key,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    print(imageNetwork);
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10)
          ),
          border: Border.all(
            color: UxBfColorsPallete.gray300
          )
        ),
        padding: const EdgeInsets.only(
          right: 10
        ),
        child: Row(
          children: [
            Image.network(
              imageNetwork,
              width: 60,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: UxBfTextStyle.headingH6OpenSans),
                  Text(
                    subtitle, style: UxBfTextStyle.headingH6OpenSans.copyWith(
                      color: UxBfColorsPallete.primaryPurple400,
                      fontWeight: FontWeight.bold
                    )
                  )
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}