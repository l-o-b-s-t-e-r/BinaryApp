import 'package:binary_app/data/data_sources/api/business_api_interface.dart';
import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:binary_app/domain/models/error_model.dart';
import 'package:binary_app/domain/models/result.dart';
import 'package:binary_app/domain/repositories/business_repository_interface.dart';

class BusinessRepository implements BusinessRepositoryInterface {
  BusinessRepository({required this.api});

  final BusinessApiInterface api;

  @override
  Future<Result<BusinessesModel>> loadBusinesses() {
    try {
      api.getBusinesses();
      return Future.value(ResultError(Unknown()));
    } catch (e, stackTrace) {
      return Future.value(ResultError(Unknown()));
    }
  }
}
