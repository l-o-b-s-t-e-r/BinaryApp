import 'package:binary_app/features/business/data/data_sources/api/business_api.dart';
import 'package:binary_app/features/business/domain/models/businesses_model.dart';
import 'package:binary_app/features/business/domain/models/error_model.dart';
import 'package:binary_app/features/business/domain/models/result.dart';
import 'package:binary_app/features/business/domain/repositories/business_repository_interface.dart';

class BusinessRepository implements BusinessRepositoryInterface {
  BusinessRepository({required this.api});

  final BusinessApi api;

  @override
  Future<Result<BusinessesModel>> loadBusinesses({
    required int limit,
    required int offset,
    required String includes,
    required String filters,
  }) async {
    try {
      final result = await api.getBusinesses(limit, offset, includes, filters);
      final model = result.toModel();
      return Future.value(ResultSuccess(model));
    } catch (e) {
      return Future.value(ResultError(Unknown()));
    }
  }
}
