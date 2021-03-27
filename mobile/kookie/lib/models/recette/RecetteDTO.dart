import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/user/UserDTO.dart';

part 'RecetteDTO.g.dart';

@JsonSerializable()
class RecetteDTO {
  final int? id;
  final UserDTO? userDTO;
  final String name;

  RecetteDTO({this.id, this.userDTO, required this.name});

  factory RecetteDTO.fromJson(Map<String, dynamic> json) =>
      _$RecetteDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecetteDTOToJson(this);
}
