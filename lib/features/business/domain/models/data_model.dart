import 'package:binary_app/features/business/domain/models/service_category_model.dart';

class DataModel {
  DataModel({
    this.id,
    this.type,
    this.businessName,
    this.description,
    this.tagline,
    this.serviceCategories,
  });

  final String? id, type, businessName, description, tagline;
  final List<ServiceCategoryModel>? serviceCategories;
}
