import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';
import 'package:kookie/models/opinion/OpinionDTO.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/step/StepDTO.dart';

part 'RecetteDTO.g.dart';

@JsonSerializable()
class RecetteDTO {
  final int? id;
  final ProfileDTO? profile;
  final String name;
  final String? imageURL;
  final CategoryDTO category;
  final List<IngredientDTO> ingredientLines;
  final List<StepDTO> stepLines;
  final List<OpinionDTO> opinions;

  RecetteDTO(
      {this.id,
      this.profile,
      required this.name,
      this.imageURL,
      required this.category,
      required this.ingredientLines,
      required this.stepLines,
      required this.opinions});

  factory RecetteDTO.fromJson(Map<String, dynamic> json) =>
      _$RecetteDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecetteDTOToJson(this);
}
