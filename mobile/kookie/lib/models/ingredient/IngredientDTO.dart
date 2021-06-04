import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/category/CategoryDTO.dart';

part 'IngredientDTO.g.dart';

@JsonSerializable()
class IngredientDTO {
  final int? id;
  final String name;
  final bool? isVegan;
  final CategoryDTO? category;

  IngredientDTO({this.id, required this.name, this.isVegan, this.category});

  factory IngredientDTO.fromJson(Map<String, dynamic> json) =>
      _$IngredientDTOFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDTOToJson(this);
}
