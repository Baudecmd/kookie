import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/ingredient/IngredientDTO.dart';

part 'CategoryDTO.g.dart';

@JsonSerializable()
class CategoryDTO {
  final int? id;
  final String name;
  final Set<IngredientDTO>? ingredientDTOs;

  CategoryDTO({this.id, required this.name, this.ingredientDTOs});

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}
