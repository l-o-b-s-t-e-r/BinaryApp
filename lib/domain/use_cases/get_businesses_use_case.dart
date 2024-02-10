import 'dart:math';

import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:binary_app/domain/models/result.dart';
import 'package:binary_app/domain/repositories/business_repository_interface.dart';
import 'package:binary_app/utils/extension_point.dart';

class GetBusinessUseCase {
  GetBusinessUseCase({required this.repository});

  final BusinessRepositoryInterface repository;

  Future<Result<BusinessesModel>> call({
    required int offset,
    List<String> includes = const ['service_categories', 'primary_photo'],
    Point location = const Point(32.7833163, -79.9319664),
  }) {
    return repository.loadBusinesses(
      limit: 20,
      offset: offset,
      includes: includes.join(','),
      filters: location.asLatLngString(),
    );
  }
}
