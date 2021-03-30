// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IngredientDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientDTO _$IngredientDTOFromJson(Map<String, dynamic> json) {
  return IngredientDTO(
    id: json['id'] as int?,
    name: json['name'] as String,
    isVegan: json['isVegan'] as bool?,
    categoryDTO: json['categoryDTO'] == null
        ? null
        : CategoryDTO.fromJson(json['categoryDTO'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IngredientDTOToJson(IngredientDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isVegan': instance.isVegan,
      'categoryDTO': instance.categoryDTO,
    };
