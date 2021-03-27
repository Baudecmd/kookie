import 'package:json_annotation/json_annotation.dart';

part 'UserDTO.g.dart';

@JsonSerializable()
class UserDTO {
  final int? id;
  final String email;
  final String username;
  final String password;

  UserDTO(
      {this.id,
      required this.email,
      required this.username,
      required this.password});

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
