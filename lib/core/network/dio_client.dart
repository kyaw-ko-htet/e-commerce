import 'package:dio/dio.dart';

class DioClient {
  static Dio create() {
    final dio = Dio();
    dio.options.baseUrl = 'https://dummyjson.com';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
      ),
    );
    return dio;
  }
}
