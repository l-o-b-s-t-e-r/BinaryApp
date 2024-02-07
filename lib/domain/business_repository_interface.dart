import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:binary_app/domain/result.dart';

abstract interface class BusinessRepositoryInterface {
  Future<Result<BusinessesModel>> loadBusinesses();
}
