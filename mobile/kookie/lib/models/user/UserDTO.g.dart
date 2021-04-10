// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return UserDTO(
    id: json['id'] as int?,
    username: json['username'] as String?,
    password: json['password'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'token': instance.token,
    };
