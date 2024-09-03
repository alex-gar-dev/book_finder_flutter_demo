import 'package:book_finder_flutter_demo/ux/index.dart';
import 'package:flutter/material.dart';

class UxBfCarrouselPromotion extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const UxBfCarrouselPromotion({
    required this.items,
    super.key
  });

  @override
  State<UxBfCarrouselPromotion> createState() => _UxBfCarrouselPromotionState();
}

class _UxBfCarrouselPromotionState extends State<UxBfCarrouselPromotion> {

  final PageController  _pageController = PageController(
    viewportFraction: 0.89
  );
  late List<Map<String, dynamic>> _pages;
  int _activePage = 0;

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
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: _pages.length,
          padEnds: false,
          onPageChanged: (int page) {
            _activePage = page;
            setState(() {
              
            });
          },
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: const EdgeInsets.only(
                right: 20,
                bottom: 30
              ),
              child: UxBfPromotion(
                title: _pages[index]['label'] ?? '',
                description: _pages[index]['description'] ?? '',
                image: _pages[index]['image'] ?? '',
              ),
            );
          }
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              _pages.length, (index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: InkWell(
                  onTap: () {
                    _pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: _activePage == index
                        ? UxBfColorsPallete.primaryPurple500
                        : UxBfColorsPallete.primaryPurple100,
                  ),
                ),
              )
            )
          )
        )
      ],
    );
  }
}