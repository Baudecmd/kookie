import 'package:json_annotation/json_annotation.dart';

part 'RecetteThumbnailDTO.g.dart';

@JsonSerializable()
class RecetteThumbnailDTO {
  final int id;
  final String name;
  final String? image;
  final int? note;
  bool isFavorite;

  RecetteThumbnailDTO(
      {required this.id,
      required this.name,
      this.image,
      this.note,
      required this.isFavorite});

  factory RecetteThumbnailDTO.fromJson(Map<String, dynamic> json) =>
      _$RecetteThumbnailDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecetteThumbnailDTOToJson(this);
}
