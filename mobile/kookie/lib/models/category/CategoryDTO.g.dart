// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) {
  return CategoryDTO(
    id: json['id'] as int?,
    name: json['name'] as String,
    ingredientDTOs: (json['ingredientDTOs'] as List<dynamic>?)
        ?.map((e) => IngredientDTO.fromJson(e as Map<String, dynamic>))
        .toSet(),
  );
}

Map<String, dynamic> _$CategoryDTOToJson(CategoryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ingredientDTOs': instance.ingredientDTOs?.toList(),
    };
