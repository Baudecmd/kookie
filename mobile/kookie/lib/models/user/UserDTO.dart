import 'package:json_annotation/json_annotation.dart';

part 'UserDTO.g.dart';

@JsonSerializable()
class UserDTO {
  final int? id;
  final String? username;
  final String? password;
  final String? token;

  UserDTO({this.id, this.username, this.password, this.token});

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  @override
  String toString() {
    return "username ${this.username}, pwd ${this.password}, token ${this.token}";
  }
}
