import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/user/UserDTO.dart';

part 'ProfileDTO.g.dart';

@JsonSerializable()
class ProfileDTO {
  final int? id;
  final UserDTO? user;
  final String? firstName;
  final String? lastName;

  ProfileDTO({this.id, this.user, this.firstName, this.lastName});

  factory ProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDTOToJson(this);

  @override
  String toString() {
    return "id ${this.id}, user {${this.user}}, fname ${this.firstName}, lname ${this.lastName}";
  }
}
