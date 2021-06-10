// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IngredientLineDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientLineDTO _$IngredientLineDTOFromJson(Map<String, dynamic> json) {
  return IngredientLineDTO(
    id: json['id'] as int?,
    ingredient:
        IngredientDTO.fromJson(json['ingredient'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$IngredientLineDTOToJson(IngredientLineDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingredient': instance.ingredient,
      'quantity': instance.quantity,
    };
