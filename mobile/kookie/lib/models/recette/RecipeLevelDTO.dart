import 'package:json_annotation/json_annotation.dart';

part 'RecipeLevelDTO.g.dart';

@JsonSerializable()
class RecipeLevelDTO {
  final int id;
  final String name;

  RecipeLevelDTO({required this.id, required this.name});

  factory RecipeLevelDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeLevelDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeLevelDTOToJson(this);
}
