import 'package:binary_app/data/dto/attributes_dto.dart';
import 'package:binary_app/data/dto/links_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'included_dto.g.dart';

@JsonSerializable()
class IncludedDto {
  IncludedDto({this.id, this.type, this.attributes, this.links});

  String? id;
  String? type;
  AttributesDto? attributes;
  LinksDto? links;

  factory IncludedDto.fromJson(Map<String, dynamic> json) =>
      _$IncludedDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IncludedDtoToJson(this);
}
