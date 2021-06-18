import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/Ustensil/UstensilDTO.dart';
import 'package:kookie/models/category/CategoryDTO.dart';
import 'package:kookie/models/ingredient/IngredientLineDTO.dart';
import 'package:kookie/models/opinion/OpinionDTO.dart';
import 'package:kookie/models/profile/ProfileDTO.dart';
import 'package:kookie/models/step/StepDTO.dart';

part 'RecetteDTO.g.dart';

@JsonSerializable()
class RecetteDTO {
  final int? id;
  final ProfileDTO? profile;
  final String name;
  final String? image;
  bool? isFavorite;
  final CategoryDTO? category;
  final List<IngredientLineDTO>? ingredientLines;
  final List<StepDTO>? steps;
  final List<OpinionDTO>? opinions;

  RecetteDTO(
      {this.id,
      this.profile,
      required this.name,
      this.image,
      this.isFavorite,
      this.category,
      this.ingredientLines,
      this.steps,
      this.opinions});

  factory RecetteDTO.fromJson(Map<String, dynamic> json) =>
      _$RecetteDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecetteDTOToJson(this);

  List<UstensilDTO> getAllUstensils() {
    List<UstensilDTO> UstensilList = [];

    for (var step in steps!) {
      UstensilList.addAll(step.ustensils as Iterable<UstensilDTO>);
    }

    final ids = UstensilList.map((e) => e.id).toSet();

    UstensilList.retainWhere((x) => ids.remove(x.id));

    return UstensilList;
  }
}
