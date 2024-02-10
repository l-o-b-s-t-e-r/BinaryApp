import 'dart:math';

import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:binary_app/domain/models/result.dart';
import 'package:binary_app/domain/repositories/business_repository_interface.dart';
import 'package:binary_app/utils/extension_point.dart';

class GetBusinessByLocationUseCase {
  GetBusinessByLocationUseCase({required this.repository});

  final BusinessRepositoryInterface repository;

  Future<Result<BusinessesModel>> call(
    int offset, [
    List<String> includes = const ['service_categories', 'primary_photo'],
    Point location = const Point(40.7484, 73.9857),
  ]) {
    return repository.loadBusinesses(
      limit: 10,
      offset: offset,
      includes: includes.join(','),
      filters: location.asLatLngString(),
    );
  }
}
