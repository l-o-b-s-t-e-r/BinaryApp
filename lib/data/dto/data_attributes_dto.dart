import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_attributes_dto.g.dart';

@JsonSerializable()
class DataAttributesDto {
  DataAttributesDto({
    this.businessName,
    this.description,
    this.tagline,
  });

  @JsonKey(name: 'business_name')
  String? businessName;
  String? description;
  String? tagline;

  factory DataAttributesDto.fromJson(Map<String, dynamic> json) =>
      _$DataAttributesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataAttributesDtoToJson(this);
}
