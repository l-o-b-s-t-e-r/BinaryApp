import 'package:binary_app/domain/business_repository_interface.dart';
import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:binary_app/domain/result.dart';

class GetBusinessByLocation {
  GetBusinessByLocation({required this.repository});

  final BusinessRepositoryInterface repository;

  Future<Result<BusinessesModel>> call(int page) {
    return repository.fetchBusinesses();
  }
}
