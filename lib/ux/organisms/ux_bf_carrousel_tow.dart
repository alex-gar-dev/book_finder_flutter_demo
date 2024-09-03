import 'package:book_finder_flutter_demo/ux/molecules/ux_bf_tow.dart';
import 'package:flutter/material.dart';

class UxBfCarrouselTow extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final Function(
    String title,
    String image
  ) onPressed;

  const UxBfCarrouselTow({
    required this.items, 
    required this.onPressed,
    super.key
  });

  @override
  State<UxBfCarrouselTow> createState() => _UxBfCarrouselTowState();
}

class _UxBfCarrouselTowState extends State<UxBfCarrouselTow> {
  final PageController _pageController = PageController(viewportFraction: 0.4);
  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages = widget.items;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _pages.length,
      padEnds: false,
      onPageChanged: (int page) {
      },
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            widget.onPressed(_pages[index]['label'], _pages[index]['image']);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20, bottom: 0),
            child: UxBfTow(
              title: _pages[index]['label'] ?? '',
              price: _pages[index]['price'] ?? '',
              image: _pages[index]['image'] ?? '',
            ),
          ),
        );
      }
    );
  }
}
