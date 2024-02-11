import 'package:dio/dio.dart';

abstract interface class HttpClientFactoryInterface {
  Dio create();
}
