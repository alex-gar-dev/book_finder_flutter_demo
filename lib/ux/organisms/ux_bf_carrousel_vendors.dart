import 'package:book_finder_flutter_demo/ux/molecules/ux_bf_vendor.dart';
import 'package:flutter/material.dart';

class UxBfCarrouselVendors extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final Function(String author) onPressed;

  const UxBfCarrouselVendors({
    required this.items,
    required this.onPressed,
    super.key
  });

  @override
  State<UxBfCarrouselVendors> createState() => _UxBfCarrouselVendorsState();
}

class _UxBfCarrouselVendorsState extends State<UxBfCarrouselVendors> {
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
              widget.onPressed(_pages[index]['name'] ?? '');
            },
            child: Container(
              margin: const EdgeInsets.only(right: 30, bottom: 0),
              child: UxBfVendor(
                name: _pages[index]['name'] ?? '',
                occupation: _pages[index]['occupation'] ?? '',
                image: _pages[index]['image'] ?? '',
              ),
            ),
          );
        });
  }
}
