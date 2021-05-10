import 'package:json_annotation/json_annotation.dart';

part 'StepTypeDTO.g.dart';

@JsonSerializable()
class StepTypeDTO {
  final int? id;
  final String name;

  StepTypeDTO({this.id, required this.name});

  factory StepTypeDTO.fromJson(Map<String, dynamic> json) =>
      _$StepTypeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StepTypeDTOToJson(this);
}
