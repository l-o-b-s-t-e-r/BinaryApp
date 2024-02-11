import 'package:binary_app/features/business/data/dtos/service_categories_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'relationships_dto.g.dart';

@JsonSerializable()
class RelationshipsDto {
  RelationshipsDto({this.serviceCategories});

  @JsonKey(name: 'service_categories')
  final ServiceCategoriesDto? serviceCategories;

  factory RelationshipsDto.fromJson(Map<String, dynamic> json) =>
      _$RelationshipsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RelationshipsDtoToJson(this);
}
