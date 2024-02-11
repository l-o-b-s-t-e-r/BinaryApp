import 'package:binary_app/features/business/data/dtos/data_attributes_dto.dart';
import 'package:binary_app/features/business/data/dtos/relationships_dto.dart';
import 'package:binary_app/features/business/domain/models/data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  DataDto({this.id, this.type, this.attributes, this.relationships});

  String? id;
  String? type;
  DataAttributesDto? attributes;
  RelationshipsDto? relationships;

  factory DataDto.fromJson(Map<String, dynamic> json) =>
      _$DataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataDtoToJson(this);

  DataModel toModel() => DataModel(
      id: id,
      type: type,
      businessName: attributes?.businessName,
      description: attributes?.description,
      tagline: attributes?.tagline,
      serviceCategories: relationships?.serviceCategories?.data
          ?.map((e) => e.toModel())
          .toList());
}
