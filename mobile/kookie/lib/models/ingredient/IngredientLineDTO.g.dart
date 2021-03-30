// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IngredientLineDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientLineDTO _$IngredientLineDTOFromJson(Map<String, dynamic> json) {
  return IngredientLineDTO(
    id: json['id'] as int?,
    recetteDTO: RecetteDTO.fromJson(json['recetteDTO'] as Map<String, dynamic>),
    ingredientDTO:
        IngredientDTO.fromJson(json['ingredientDTO'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$IngredientLineDTOToJson(IngredientLineDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recetteDTO': instance.recetteDTO,
      'ingredientDTO': instance.ingredientDTO,
      'quantity': instance.quantity,
    };
