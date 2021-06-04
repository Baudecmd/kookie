import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/ingredient/IngredientLineDTO.dart';

import 'StepTypeDTO.dart';

part 'StepDTO.g.dart';

@JsonSerializable()
class StepDTO {
  final int? id;
  final String name;
  final IngredientLineDTO? ingredientLine;
  final int? duration;
  final int stepNumber;
  final StepTypeDTO stepType;

  StepDTO(
      {this.id,
      required this.name,
      this.ingredientLine,
      this.duration,
      required this.stepNumber,
      required this.stepType});

  factory StepDTO.fromJson(Map<String, dynamic> json) =>
      _$StepDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StepDTOToJson(this);
}
