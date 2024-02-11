import 'package:binary_app/features/business/data/dtos/included_attributes_dto.dart';
import 'package:binary_app/features/business/domain/models/included_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'included_dto.g.dart';

@JsonSerializable()
class IncludedDto {
  IncludedDto({this.id, this.type, this.attributes});

  String? id;
  String? type;
  IncludedAttributesDto? attributes;

  factory IncludedDto.fromJson(Map<String, dynamic> json) =>
      _$IncludedDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IncludedDtoToJson(this);

  IncludedModel toModel([String? id, String? type, String? categoryType]) =>
      IncludedModel(
        id: id ?? this.id ?? '',
        type: type ?? this.type ?? '',
        name: attributes?.name,
        categoryType: categoryType ?? attributes?.categoryType ?? '',
        description: attributes?.description,
      );
}
