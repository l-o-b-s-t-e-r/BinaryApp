import 'package:binary_app/domain/models/businesses_model.dart';

abstract interface class BusinessRepositoryInterface {
  Future<BusinessesModel> fetchBusinesses();
}
