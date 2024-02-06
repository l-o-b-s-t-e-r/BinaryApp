import 'package:binary_app/data/dto/data_attributes_dto.dart';
import 'package:binary_app/domain/models/data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  DataDto({this.id, this.type, this.attributes});

  String? id;
  String? type;
  DataAttributesDto? attributes;

  factory DataDto.fromJson(Map<String, dynamic> json) =>
      _$DataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataDtoToJson(this);

  DataModel toModel() => DataModel(
        id: id,
        type: type,
        businessName: attributes?.businessName,
        description: attributes?.description,
        tagline: attributes?.tagline,
      );
}
