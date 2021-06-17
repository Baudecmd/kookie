import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/Ustensil/UstensilDTO.dart';
import 'package:kookie/models/ingredient/IngredientLineDTO.dart';

import 'StepTypeDTO.dart';

part 'StepDTO.g.dart';

@JsonSerializable()
class StepDTO {
  final int? id;
  final String? name;
  final IngredientLineDTO? ingredientLine;
  final int? duration;
  int stepNumber;
  final StepTypeDTO? stepType;
  final List<UstensilDTO>? ustensils;

  StepDTO(
      {this.id,
      this.name,
      this.ingredientLine,
      this.duration,
      required this.stepNumber,
      this.stepType,
      required this.ustensils});

  factory StepDTO.fromJson(Map<String, dynamic> json) =>
      _$StepDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StepDTOToJson(this);
}
