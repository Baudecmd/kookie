// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StepLineDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepLineDTO _$StepLineDTOFromJson(Map<String, dynamic> json) {
  return StepLineDTO(
    id: json['id'] as int?,
    recetteDTO: RecetteDTO.fromJson(json['recetteDTO'] as Map<String, dynamic>),
    stepDTO: StepDTO.fromJson(json['stepDTO'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StepLineDTOToJson(StepLineDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recetteDTO': instance.recetteDTO,
      'stepDTO': instance.stepDTO,
    };
