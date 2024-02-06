import 'package:binary_app/data/dto/business_dto.dart';
import 'package:binary_app/data/dto/included_dto.dart';
import 'package:binary_app/data/dto/meta_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'businesses_body_dto.g.dart';

@JsonSerializable()
class BusinessesBodyDto {
  BusinessesBodyDto({this.meta, this.included, this.data});

  MetaDto? meta;
  List<IncludedDto>? included;
  List<BusinessDto>? data;

  factory BusinessesBodyDto.fromJson(Map<String, dynamic> json) =>
      _$BusinessesBodyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessesBodyDtoToJson(this);
}
