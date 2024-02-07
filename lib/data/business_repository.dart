import 'package:binary_app/core/business_api_interface.dart';
import 'package:binary_app/domain/business_repository_interface.dart';
import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:binary_app/domain/models/error_model.dart';
import 'package:binary_app/domain/result.dart';

class BusinessRepository implements BusinessRepositoryInterface {
  BusinessRepository({required this.api});

  final BusinessApiInterface api;

  @override
  Future<Result<BusinessesModel>> fetchBusinesses() {
    try {
      return Future.value(ResultError(Unknown()));
    } catch (e, stackTrace) {
      return Future.value(ResultError(Unknown()));
    }
  }
}
