import 'package:json_annotation/json_annotation.dart';

part 'UserDTO.g.dart';

@JsonSerializable()
class UserDTO {
  final int? id;
  late final String? username;
  late final String? password;
  final String? token;

  UserDTO({this.id, this.username, this.password, this.token});

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
