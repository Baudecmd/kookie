import 'package:json_annotation/json_annotation.dart';

part 'CredentialDTO.g.dart';

@JsonSerializable()
class CredentialDTO {
  final String username;
  final String password;

  CredentialDTO({required this.username, required this.password});

  factory CredentialDTO.fromJson(Map<String, dynamic> json) =>
      _$CredentialDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialDTOToJson(this);
}
