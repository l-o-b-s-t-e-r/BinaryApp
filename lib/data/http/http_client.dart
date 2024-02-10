import 'package:binary_app/core/enviroment.dart';
import 'package:binary_app/data/http/http_client_interface.dart';
import 'package:binary_app/data/http/http_exception.dart';
import 'package:dio/dio.dart';

class HttpClient implements HttpClientInterface {
  HttpClient({required this.dio, required this.environment});

  final Dio dio;
  final Environment environment;

  @override
  Future<T> get<T>() async {
    final response = await dio.get<T>(environment.baseUrl);
    if (response.data != null) {
      return response.data!;
    } else {
      throw HttpException(
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    }
  }
}
