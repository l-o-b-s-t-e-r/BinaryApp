import 'package:binary_app/features/business/data/dtos/service_category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_categories_dto.g.dart';

@JsonSerializable()
class ServiceCategoriesDto {
  ServiceCategoriesDto({this.data});

  final List<ServiceCategoryDto>? data;

  factory ServiceCategoriesDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoriesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoriesDtoToJson(this);
}
