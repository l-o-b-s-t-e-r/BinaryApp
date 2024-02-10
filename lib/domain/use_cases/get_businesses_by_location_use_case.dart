import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:binary_app/domain/models/result.dart';
import 'package:binary_app/domain/repositories/business_repository_interface.dart';

class GetBusinessByLocationUseCase {
  GetBusinessByLocationUseCase({required this.repository});

  final BusinessRepositoryInterface repository;

  Future<Result<BusinessesModel>> call(int page) {
    return repository.loadBusinesses();
  }
}
