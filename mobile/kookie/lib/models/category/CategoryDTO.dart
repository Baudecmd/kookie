import 'package:json_annotation/json_annotation.dart';

part 'CategoryDTO.g.dart';

@JsonSerializable()
class CategoryDTO {
  final int? id;
  final String name;

  CategoryDTO({this.id, required this.name});

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}
