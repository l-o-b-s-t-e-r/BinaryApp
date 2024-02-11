import 'package:binary_app/features/business/domain/models/service_category_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_category_dto.g.dart';

@JsonSerializable()
class ServiceCategoryDto {
  ServiceCategoryDto({this.id, this.type});

  final String? id, type;

  factory ServiceCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceCategoryDtoToJson(this);

  ServiceCategoryModel toModel() => ServiceCategoryModel(id: id, type: type);
}
