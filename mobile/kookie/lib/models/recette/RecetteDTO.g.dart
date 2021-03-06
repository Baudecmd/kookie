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
    image: json['image'] as String?,
    isFavorite: json['isFavorite'] as bool?,
    category: json['category'] == null
        ? null
        : CategoryDTO.fromJson(json['category'] as Map<String, dynamic>),
    ingredientLines: (json['ingredientLines'] as List<dynamic>?)
        ?.map((e) => IngredientLineDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
    steps: (json['steps'] as List<dynamic>?)
        ?.map((e) => StepDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
    opinions: (json['opinions'] as List<dynamic>?)
        ?.map((e) => OpinionDTO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RecetteDTOToJson(RecetteDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'name': instance.name,
      'image': instance.image,
      'isFavorite': instance.isFavorite,
      'category': instance.category,
      'ingredientLines': instance.ingredientLines,
      'steps': instance.steps,
      'opinions': instance.opinions,
    };
