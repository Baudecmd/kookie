import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/ingredient/IngredientLineDTO.dart';

import 'StepTypeDTO.dart';

part 'StepDTO.g.dart';

@JsonSerializable()
class StepDTO {
  final int? id;
  final int stepNumber;
  final String stepName;
  final IngredientLineDTO? ingredientLine;
  final int? duration;
  final StepTypeDTO stepType;

  StepDTO(
      {this.id,
      required this.stepNumber,
      required this.stepName,
      this.ingredientLine,
      this.duration,
      required this.stepType});

  factory StepDTO.fromJson(Map<String, dynamic> json) =>
      _$StepDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StepDTOToJson(this);
}
