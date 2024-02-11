import 'package:binary_app/features/business/domain/models/data_model.dart';
import 'package:binary_app/features/business/domain/models/included_model.dart';

class BusinessesModel {
  BusinessesModel({
    this.total,
    this.limit,
    this.offset,
    this.included = const [],
    this.models = const [],
  });

  final int? total, limit, offset;
  final List<IncludedModel> included;
  final List<DataModel> models;
}
