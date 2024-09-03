import 'package:book_finder_flutter_demo/src/books_browser/data/model/book.dart';
import 'package:book_finder_flutter_demo/src/books_browser/index.dart';
import 'package:book_finder_flutter_demo/ux/index.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

const String network = 'https://covers.openlibrary.org/b/isbn/';

class SearchScreenResults extends StatefulWidget {

  final String query;

  const SearchScreenResults({
    required this.query,
    super.key
  });

  @override
  State<SearchScreenResults> createState() => _SearchScreenResultsState();
}

class _SearchScreenResultsState extends State<SearchScreenResults> {

  final searchCtrl = TextEditingController();
  final _booksRepository = GetIt.instance<BooksRepositoryInterface>();
  final PagingController<int, Book> _pagingController =
      PagingController(firstPageKey: 1);
  final int _pageSize = 10;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    if (!mounted) {
      return;
    }
    try {
      final books = await _booksRepository.searchBooks(
        query: widget.query,
        pageKey: pageKey,
        pageSize: _pageSize
      );
      final isLastPage = books.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(books);
      } else {
        final nextPageKey = pageKey + books.length;
        _pagingController.appendPage(books, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results for: ${widget.query}', 
          textAlign: TextAlign.center,
          style: UxBfTextStyle.headingH6OpenSans,
        )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 20
          ),
          child: PagedListView<int, Book>.separated(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Book>(
              itemBuilder: (context, book, index) => UxBfBookItem(
                title: book.title,
                subtitle: book.authorName.isNotEmpty ? book.authorName[0] : 'Unknown',
                imageNetwork: '$network${book.isbn[0]}.jpg',
                onTap: () {
                  UxBfModalBottomSheet.showBottomModalBook(
                    onPressed: () {
                      context.pop();
                    },
                    context: context, 
                    image: '$network${book.isbn[0]}.jpg', 
                    title: book.title, 
                    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s");
                }
              )
            ), 
            separatorBuilder: (_, __) => const SizedBox(height: 20),
          )
        )
      ),
    );
  }
}