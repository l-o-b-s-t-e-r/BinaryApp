import 'package:binary_app/data/dto/attributes_dto.dart';
import 'package:binary_app/data/dto/links_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  DataDto({this.id, this.type, this.attributes, this.links});

  String? id;
  String? type;
  AttributesDto? attributes;
  LinksDto? links;

  factory DataDto.fromJson(Map<String, dynamic> json) =>
      _$DataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataDtoToJson(this);
}
