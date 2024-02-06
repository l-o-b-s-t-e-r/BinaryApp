import 'package:binary_app/domain/business_repository_interface.dart';

class GetBusinessByLocation {
  GetBusinessByLocation({required this.repository});

  final BusinessRepositoryInterface repository;

  Future<void> call(int page) {
    return repository.fetchBusinesses();
  }
}
