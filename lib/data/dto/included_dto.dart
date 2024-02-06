import 'package:binary_app/data/dto/included_attributes_dto.dart';
import 'package:binary_app/domain/models/included_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  IncludedModel toModel() => IncludedModel(
        id: id,
        type: type,
        name: attributes?.name,
        categoryType: attributes?.categoryType,
        description: attributes?.description,
      );
}
