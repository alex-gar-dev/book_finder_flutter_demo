import 'package:book_finder_flutter_demo/core/enviroment_variables/enviroment_variables.dart';
import 'package:dio/dio.dart';

class HostBooksSearch {
  final _service = Dio(); // With default `Options`.
  get service => _service;

  HostBooksSearch() {
    _configureDio();
  }
  
  Future<void> _configureDio() async {
    // Set default configs
    _service.options.baseUrl = EnviromentVariables.booksHost;
    _service.options.connectTimeout = const Duration(seconds: 5);
    _service.options.receiveTimeout = const Duration(seconds: 30);

    _service.options.queryParameters = {
      'fields': 'title,author_name,oclc,isbn'
    };
  }

}