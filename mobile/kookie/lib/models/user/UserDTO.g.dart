// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return UserDTO(
    id: json['id'] as int?,
    email: json['email'] as String?,
    username: json['username'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'token': instance.token,
    };
