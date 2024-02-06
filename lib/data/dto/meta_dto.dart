import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_dto.g.dart';

@JsonSerializable()
class MetaDto {
  MetaDto({this.total, this.limit, this.offset});

  final int? total, limit, offset;

  factory MetaDto.fromJson(Map<String, dynamic> json) =>
      _$MetaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDtoToJson(this);
}

/*@freezed
class MetaDto with _$MetaDto {
  const factory MetaDto({
    required int total,
    required int limit,
    required int offset,
  }) = _MetaDto;

  factory MetaDto.fromJson(Map<String, dynamic> json) =>
      _$MetaDtoFromJson(json);
}*/
