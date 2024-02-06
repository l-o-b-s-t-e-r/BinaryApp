import 'package:binary_app/data/dto/data_dto.dart';
import 'package:binary_app/data/dto/included_dto.dart';
import 'package:binary_app/data/dto/meta_dto.dart';
import 'package:binary_app/domain/models/businesses_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'businesses_body_dto.g.dart';

@JsonSerializable()
class BusinessesBodyDto {
  BusinessesBodyDto({this.meta, this.included, this.data});

  MetaDto? meta;
  List<IncludedDto>? included;
  List<DataDto>? data;

  factory BusinessesBodyDto.fromJson(Map<String, dynamic> json) =>
      _$BusinessesBodyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessesBodyDtoToJson(this);

  BusinessesModel toModel() => BusinessesModel(
        total: meta?.total,
        limit: meta?.limit,
        offset: meta?.offset,
        included: included?.map((e) => e.toModel()).toList(),
        data: data?.map((e) => e.toModel()).toList(),
      );
}
