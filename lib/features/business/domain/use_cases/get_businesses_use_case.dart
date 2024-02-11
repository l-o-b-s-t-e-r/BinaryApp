import 'dart:math';

import 'package:binary_app/features/business/domain/models/businesses_model.dart';
import 'package:binary_app/features/business/domain/models/result.dart';
import 'package:binary_app/features/business/domain/repositories/business_repository_interface.dart';
import 'package:binary_app/utils/extension_point.dart';

class GetBusinessUseCase {
  GetBusinessUseCase({required this.repository});

  final BusinessRepositoryInterface repository;

  Future<Result<BusinessesModel>> call({
    required int limit,
    required int offset,
    List<String> includes = const ['service_categories'],
    Point location = const Point(40.7484, -73.9857),
  }) {
    return repository.loadBusinesses(
      limit: limit,
      offset: offset,
      includes: includes.join(','),
      filters: location.asLatLngString(),
    );
  }
}
