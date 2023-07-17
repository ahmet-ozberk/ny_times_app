import 'package:dio/dio.dart';

class NetworkManager {
  Dio? _dio;

  NetworkManager() {
    _dio ??= Dio();
    _dio!.options.contentType = 'application/json';
    _dio!.options.baseUrl =
        'https://api.nytimes.com/svc/mostpopular/v2/viewed/';

    _dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (e, handler) {
        handler.next(e);
      },
    ));
  }
  
  Future<Response> get([String args = '']) async => await _dio!.get(args);
}
