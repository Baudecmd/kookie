// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UstensilLineDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UstensilLineDTO _$UstensilLineDTOFromJson(Map<String, dynamic> json) {
  return UstensilLineDTO(
    id: json['id'] as int?,
    ustensil: json['ustensil'] == null
        ? null
        : UstensilDTO.fromJson(json['ustensil'] as Map<String, dynamic>),
    quantity: json['quantity'] as int?,
  );
}

Map<String, dynamic> _$UstensilLineDTOToJson(UstensilLineDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ustensil': instance.ustensil,
      'quantity': instance.quantity,
    };
