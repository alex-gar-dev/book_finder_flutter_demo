import 'package:book_finder_flutter_demo/ux/index.dart';
import 'package:flutter/material.dart';

class UxBfPromotion extends StatelessWidget {

  final String title;
  final String description;
  final String image;

  const UxBfPromotion({
    required this.title,
    required this.description,
    required this.image,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UxBfColorsPallete.primaryPurple100,
        borderRadius: const BorderRadius.all(
          Radius.circular(10)
        )
      ),
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: UxBfTextStyle.headingH4OpenSans),
                Text(description, style: UxBfTextStyle.body16RegularReboto,),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 100,
                  child: UxBfButton.small(
                    label: 'Order now',
                    onPressed: () {
                      
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/$image'),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}