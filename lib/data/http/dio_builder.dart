import 'package:binary_app/data/http/dio_factory_interface.dart';
import 'package:dio/dio.dart';

class DioFactory implements DioFactoryInterface {
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
