import 'package:book_finder_flutter_demo/src/books_browser/data/model/book.dart';

abstract class BooksRepositoryInterface {
  Future<List<Book>> searchBooks({
    required String query,
    required int pageKey, 
    required int pageSize
  });
}