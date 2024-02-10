import 'package:json_annotation/json_annotation.dart';

part 'included_attributes_dto.g.dart';

@JsonSerializable()
class IncludedAttributesDto {
  IncludedAttributesDto({
    this.name,
    this.categoryType,
    this.description,
    this.isApproved,
    this.slug,
  });

  String? name;
  @JsonKey(name: 'lesson_id')
  String? categoryType;
  String? description;
  @JsonKey(name: 'is_approved')
  bool? isApproved;
  String? slug;

  factory IncludedAttributesDto.fromJson(Map<String, dynamic> json) =>
      _$IncludedAttributesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IncludedAttributesDtoToJson(this);
}
