import 'package:book_finder_flutter_demo/core/api/host_books_search.dart';
import 'package:book_finder_flutter_demo/src/books_browser/index.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  
  static void setupLocator() async {
    getIt.registerSingleton<HostBooksSearch>(HostBooksSearch());
    getIt.registerFactory<BooksRepositoryInterface>(() => BooksRepository());
  }
}