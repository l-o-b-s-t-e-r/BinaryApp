import 'package:binary_app/data/dto/data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'relationships_dto.g.dart';

@JsonSerializable()
class RelationshipsDto {
  RelationshipsDto({this.data});

  DataDto? data;

  factory RelationshipsDto.fromJson(Map<String, dynamic> json) =>
      _$RelationshipsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipsDtoToJson(this);
}
