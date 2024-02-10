import 'package:binary_app/domain/models/data_model.dart';
import 'package:binary_app/domain/models/included_model.dart';

class BusinessesModel {
  BusinessesModel({
    this.total,
    this.limit,
    this.offset,
    this.included,
    this.models,
  });

  int? total, limit, offset;
  List<IncludedModel>? included;
  List<DataModel>? models;
}
