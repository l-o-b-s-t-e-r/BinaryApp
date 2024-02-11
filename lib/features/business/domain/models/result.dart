import 'package:binary_app/features/business/domain/models/error_model.dart';

sealed class Result<T> {}

class ResultSuccess<T> extends Result<T> {
  ResultSuccess(this.data);

  final T data;
}

class ResultError<T> extends Result<T> {
  ResultError(this.data);

  final ErrorModel data;
}
