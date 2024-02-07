class HttpException implements Exception {
  HttpException({this.statusCode, this.statusMessage});

  final int? statusCode;
  final String? statusMessage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HttpException &&
          runtimeType == other.runtimeType &&
          statusCode == other.statusCode &&
          statusMessage == other.statusMessage;

  @override
  int get hashCode => statusCode.hashCode ^ statusMessage.hashCode;
}
