import 'package:binary_app/data/http/http_client_interface.dart';
import 'package:binary_app/data/http/http_exception.dart';
import 'package:dio/dio.dart';

class HttpClient implements HttpClientInterface {
  HttpClient(this.dio);

  final Dio dio;

  @override
  Future<T> get<T>() async {
    final response = await dio.get<T>('');
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
