import 'package:binary_app/data/dto/attributes_dto.dart';
import 'package:binary_app/data/dto/relationships_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_dto.g.dart';

@JsonSerializable()
class BusinessDto {
  BusinessDto({this.id, this.type, this.attributes, this.relationships});

  String? id;
  String? type;
  AttributesDto? attributes;
  RelationshipsDto? relationships;

  factory BusinessDto.fromJson(Map<String, dynamic> json) =>
      _$BusinessDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessDtoToJson(this);
}
