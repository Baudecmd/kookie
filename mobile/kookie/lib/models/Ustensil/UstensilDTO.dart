import 'package:json_annotation/json_annotation.dart';

part 'UstensilDTO.g.dart';

@JsonSerializable()
class UstensilDTO {
  final int? id;
  final String? name;

  UstensilDTO({this.id, this.name});

  factory UstensilDTO.fromJson(Map<String, dynamic> json) =>
      _$UstensilDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UstensilDTOToJson(this);
}
