import 'package:json_annotation/json_annotation.dart';

part 'RecetteThumbnailDTO.g.dart';

@JsonSerializable()
class RecetteThumbnailDTO {
  final int id;
  final String name;
  final String? imageURL;
  final int note;
  final bool isFavorite;

  RecetteThumbnailDTO(
      {required this.id,
      required this.name,
      this.imageURL,
      required this.note,
      required this.isFavorite});

  factory RecetteThumbnailDTO.fromJson(Map<String, dynamic> json) =>
      _$RecetteThumbnailDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecetteThumbnailDTOToJson(this);
}
