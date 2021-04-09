// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) {
  return ProfileDTO(
    id: json['id'] as int?,
    user: json['user'] == null
        ? null
        : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
  );
}

Map<String, dynamic> _$ProfileDTOToJson(ProfileDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
