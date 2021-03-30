import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';

import 'StepDTO.dart';

part 'StepLineDTO.g.dart';

@JsonSerializable()
class StepLineDTO {
  final int? id;
  final RecetteDTO recetteDTO;
  final StepDTO stepDTO;

  StepLineDTO({this.id, required this.recetteDTO, required this.stepDTO});

  factory StepLineDTO.fromJson(Map<String, dynamic> json) =>
      _$StepLineDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StepLineDTOToJson(this);
}
