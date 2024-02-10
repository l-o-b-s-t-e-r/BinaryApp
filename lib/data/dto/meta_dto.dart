import 'package:json_annotation/json_annotation.dart';

part 'meta_dto.g.dart';

@JsonSerializable()
class MetaDto {
  MetaDto({this.total, this.limit, this.offset});

  final int? total, limit, offset;

  factory MetaDto.fromJson(Map<String, dynamic> json) =>
      _$MetaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDtoToJson(this);
}
