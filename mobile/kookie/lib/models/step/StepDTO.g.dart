// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StepDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepDTO _$StepDTOFromJson(Map<String, dynamic> json) {
  return StepDTO(
    id: json['id'] as int?,
    name: json['name'] as String?,
    ingredientLine: json['ingredientLine'] == null
        ? null
        : IngredientLineDTO.fromJson(
            json['ingredientLine'] as Map<String, dynamic>),
    duration: json['duration'] as int?,
    stepNumber: json['stepNumber'] as int,
    stepType: json['stepType'] == null
        ? null
        : StepTypeDTO.fromJson(json['stepType'] as Map<String, dynamic>),
    ustensils: (json['ustensils'] as List<dynamic>?)
        ?.map((e) => UstensilDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$StepDTOToJson(StepDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ingredientLine': instance.ingredientLine,
      'duration': instance.duration,
      'stepNumber': instance.stepNumber,
      'stepType': instance.stepType,
      'ustensils': instance.ustensils,
    };
