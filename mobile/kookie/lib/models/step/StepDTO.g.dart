// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StepDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepDTO _$StepDTOFromJson(Map<String, dynamic> json) {
  return StepDTO(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    duration: json['duration'] as int?,
  );
}

Map<String, dynamic> _$StepDTOToJson(StepDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
    };
