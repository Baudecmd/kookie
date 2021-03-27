import 'package:json_annotation/json_annotation.dart';

part 'StepDTO.g.dart';

@JsonSerializable()
class StepDTO {
  final int? id;
  final String? name;
  final String? description;
  final int? duration;

  StepDTO({this.id, this.name, this.description, this.duration});

  factory StepDTO.fromJson(Map<String, dynamic> json) =>
      _$StepDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StepDTOToJson(this);
}
