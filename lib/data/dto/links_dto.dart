import 'package:freezed_annotation/freezed_annotation.dart';

part 'links_dto.g.dart';

@JsonSerializable()
class LinksDto {
  LinksDto({this.self});

  Map<String, dynamic>? self;

  factory LinksDto.fromJson(Map<String, dynamic> json) =>
      _$LinksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LinksDtoToJson(this);
}
