// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CredentialDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialDTO _$CredentialDTOFromJson(Map<String, dynamic> json) {
  return CredentialDTO(
    username: json['username'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$CredentialDTOToJson(CredentialDTO instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
