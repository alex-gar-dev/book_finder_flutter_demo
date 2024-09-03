import 'package:book_finder_flutter_demo/src/books_browser/presentation/home_controller.dart';
import 'package:book_finder_flutter_demo/ux/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UxAppBarSearch(
        widgetTitle: const Text(
          'Home', style: UxBfTextStyle.headingH4OpenSans
        ),
        onSubmitted: (value) {
          context.push('/search-results/$value');
        },
        onPressedUserIcon: () {
          context.push('/profile');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 190,
              child: UxBfCarrouselPromotion(
                items: HomeController.promotions
              ),
            ),
            const SizedBox(height: 20),
            const UxBfSectionTitle(
              title: 'Top of the week',
              description: 'See all',
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: UxBfCarrouselTow(
                items: HomeController.tow,
                onPressed: (title, image) {
                  UxBfModalBottomSheet.showBottomModalBook(
                    onPressed: () {
                      context.pop();
                    },
                    context: context, 
                    image: 'https://cdn.kobo.com/book-images/b154b5e2-0453-4434-a1fa-5ed85d17bce9/353/569/90/False/the-kite-runner-2.jpg', 
                    title: title, 
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
                  );
                }
              ),
            ),
            const SizedBox(height: 10),
            const UxBfSectionTitle(
              title: 'Vendors',
              description: 'See all',
            ),
            SizedBox(
              height: 200,
              child: UxBfCarrouselVendors(
                items: HomeController.vendors,
                onPressed: (author) {
                  context.push('/search-results/$author');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}