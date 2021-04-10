import 'package:json_annotation/json_annotation.dart';

part 'CredentialDTO.g.dart';

@JsonSerializable()
class CredentialDTO {
  late final String? username;
  late final String? password;

  CredentialDTO({this.username, this.password});

  factory CredentialDTO.fromJson(Map<String, dynamic> json) =>
      _$CredentialDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialDTOToJson(this);
}
