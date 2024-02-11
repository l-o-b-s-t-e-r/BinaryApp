import 'package:binary_app/core/http/http_client_factory_interface.dart';
import 'package:dio/dio.dart';

class HttpClientFactory implements HttpClientFactoryInterface {
  @override
  Dio create() {
    const timeout = Duration(seconds: 30);
    final baseOptions = BaseOptions(
      connectTimeout: timeout,
      sendTimeout: timeout,
      receiveTimeout: timeout,
    );
    final dio = Dio(baseOptions);
    return dio;
  }
}
