// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OpinionDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpinionDTO _$OpinionDTOFromJson(Map<String, dynamic> json) {
  return OpinionDTO(
    id: json['id'] as int,
    recette: RecetteDTO.fromJson(json['recette'] as Map<String, dynamic>),
    user: UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    note: json['note'] as int,
    comment: json['comment'] as String?,
  );
}

Map<String, dynamic> _$OpinionDTOToJson(OpinionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recette': instance.recette,
      'user': instance.user,
      'note': instance.note,
      'comment': instance.comment,
    };
