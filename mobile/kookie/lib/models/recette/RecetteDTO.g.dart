// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecetteDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecetteDTO _$RecetteDTOFromJson(Map<String, dynamic> json) {
  return RecetteDTO(
    id: json['id'] as int?,
    profile: json['profile'] == null
        ? null
        : ProfileDTO.fromJson(json['profile'] as Map<String, dynamic>),
    name: json['name'] as String,
    imageURL: json['imageURL'] as String?,
    category: CategoryDTO.fromJson(json['category'] as Map<String, dynamic>),
    ingredientLines: (json['ingredientLines'] as List<dynamic>)
        .map((e) => IngredientDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
    stepLines: (json['stepLines'] as List<dynamic>)
        .map((e) => StepDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
    opinions: (json['opinions'] as List<dynamic>)
        .map((e) => OpinionDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RecetteDTOToJson(RecetteDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'category': instance.category,
      'ingredientLines': instance.ingredientLines,
      'stepLines': instance.stepLines,
      'opinions': instance.opinions,
    };
