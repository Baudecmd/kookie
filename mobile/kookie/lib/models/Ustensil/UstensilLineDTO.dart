import 'package:json_annotation/json_annotation.dart';
import 'package:kookie/models/Ustensil/UstensilDTO.dart';

part 'UstensilLineDTO.g.dart';

@JsonSerializable()
class UstensilLineDTO {
  final int? id;
  final UstensilDTO? ustensil;
  final int? quantity;

  UstensilLineDTO({this.id, this.ustensil, this.quantity});

  factory UstensilLineDTO.fromJson(Map<String, dynamic> json) =>
      _$UstensilLineDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UstensilLineDTOToJson(this);
}
