// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecetteDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecetteDTO _$RecetteDTOFromJson(Map<String, dynamic> json) {
  return RecetteDTO(
    id: json['id'] as int?,
    userDTO: json['userDTO'] == null
        ? null
        : UserDTO.fromJson(json['userDTO'] as Map<String, dynamic>),
    name: json['name'] as String,
    ingredientLinesDTO: (json['ingredientLinesDTO'] as List<dynamic>)
        .map((e) => IngredientDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
    stepLinesDTO: json['stepLinesDTO'] as List<dynamic>,
  );
}

Map<String, dynamic> _$RecetteDTOToJson(RecetteDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userDTO': instance.userDTO,
      'name': instance.name,
      'ingredientLinesDTO': instance.ingredientLinesDTO,
      'stepLinesDTO': instance.stepLinesDTO,
    };
