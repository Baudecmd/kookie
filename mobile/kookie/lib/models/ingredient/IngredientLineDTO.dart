import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';
import 'package:kookie/models/recette/RecetteDTO.dart';

part 'IngredientLineDTO.g.dart';

@JsonSerializable()
class IngredientLineDTO {
  final int? id;
  final RecetteDTO recetteDTO;
  final IngredientDTO ingredient;
  final int quantity;

  IngredientLineDTO(
      {this.id,
      required this.recetteDTO,
      required this.ingredient,
      required this.quantity});

  factory IngredientLineDTO.fromJson(Map<String, dynamic> json) =>
      _$IngredientLineDTOFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientLineDTOToJson(this);
}
