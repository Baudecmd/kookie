import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';

part 'OpinionDTO.g.dart';

@JsonSerializable()
class OpinionDTO {
  final int id;
  final RecetteDTO recette;
  final ProfileDTO profile;
  final int note;
  final String? comment;

  OpinionDTO(
      {required this.id,
      required this.recette,
      required this.profile,
      required this.note,
      this.comment});

  factory OpinionDTO.fromJson(Map<String, dynamic> json) =>
      _$OpinionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$OpinionDTOToJson(this);
}
