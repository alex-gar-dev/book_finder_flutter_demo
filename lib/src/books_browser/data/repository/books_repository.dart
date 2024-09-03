import 'package:book_finder_flutter_demo/core/index.dart';
import 'package:book_finder_flutter_demo/src/books_browser/data/model/book.dart';
import 'package:book_finder_flutter_demo/src/books_browser/domain/repository/books_repository_interface.dart';
import 'package:dio/dio.dart';

class BooksRepository implements BooksRepositoryInterface {

  final _hostBooksSearch = getIt<HostBooksSearch>();

  @override
  Future<List<Book>> searchBooks({
    required String query,
    required int pageKey, 
    required int pageSize
  }) async {
    try {
      final Map<String, dynamic> params = {
        'q': query,
        'page': pageKey,
        'limit': pageSize
      };
      final Response response = await _hostBooksSearch.service.get('', queryParameters: params);
      if ([200, 201].contains(response.statusCode)) {
        final data = List.from(response.data['docs']);
        return data.map((d) => Book.froMap(d)).toList();
      }
      throw Exception('Error parsing data');
    } catch (_) {
      throw Exception('Error fetching data');
    }
  }
  
}