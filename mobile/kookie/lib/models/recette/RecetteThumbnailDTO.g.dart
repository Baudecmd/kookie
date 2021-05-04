// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecetteThumbnailDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecetteThumbnailDTO _$RecetteThumbnailDTOFromJson(Map<String, dynamic> json) {
  return RecetteThumbnailDTO(
    id: json['id'] as int,
    name: json['name'] as String,
    note: json['note'] as int,
    isFavorite: json['isFavorite'] as bool,
  );
}

Map<String, dynamic> _$RecetteThumbnailDTOToJson(
        RecetteThumbnailDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'note': instance.note,
      'isFavorite': instance.isFavorite,
    };
