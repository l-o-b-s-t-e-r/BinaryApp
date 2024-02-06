import 'package:freezed_annotation/freezed_annotation.dart';

part 'attributes_dto.g.dart';

@JsonSerializable()
class AttributesDto {
  AttributesDto({
    this.name,
    this.categoryType,
    this.description,
    this.isApproved,
    this.slug,
  });

  String? name;
  String? categoryType;
  String? description;
  bool? isApproved;
  String? slug;

  factory AttributesDto.fromJson(Map<String, dynamic> json) =>
      _$AttributesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesDtoToJson(this);
}
