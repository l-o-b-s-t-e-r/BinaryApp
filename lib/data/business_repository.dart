import 'package:binary_app/core/business_api_interface.dart';
import 'package:binary_app/domain/business_repository_interface.dart';
import 'package:binary_app/domain/models/businesses_model.dart';

class BusinessRepository implements BusinessRepositoryInterface {
  BusinessRepository({required this.api});

  final BusinessApiInterface api;

  @override
  Future<BusinessesModel> fetchBusinesses() async {
    return Future.value();
  }
}
