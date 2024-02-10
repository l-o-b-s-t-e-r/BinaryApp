import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:binary_app/domain/models/result.dart';

abstract interface class BusinessRepositoryInterface {
  Future<Result<BusinessesModel>> loadBusinesses({
    required int limit,
    required int offset,
    required String includes,
    required String filters,
  });
}
