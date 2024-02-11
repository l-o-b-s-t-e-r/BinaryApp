import 'package:binary_app/features/business/data/dtos/data_dto.dart';
import 'package:binary_app/features/business/data/dtos/included_dto.dart';
import 'package:binary_app/features/business/data/dtos/meta_dto.dart';
import 'package:binary_app/features/business/domain/models/businesses_model.dart';
import 'package:json_annotation/json_annotation.dart';

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
        included: included
                ?.where(
                  (e) =>
                      e.id?.isNotEmpty == true &&
                      e.type?.isNotEmpty == true &&
                      e.attributes?.categoryType?.isNotEmpty == true,
                )
                .map((e) => e.toModel(e.id, e.type, e.attributes?.categoryType))
                .toList() ??
            [],
        models: data?.map((e) => e.toModel()).toList() ?? [],
      );
}
