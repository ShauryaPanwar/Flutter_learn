



import 'package:json_annotation/json_annotation.dart';


part 'image_from.g.dart';


@JsonSerializable()
class Pixelfrom {
  String id;
  String filename;
  String? title;
  @JsonKey(name: 'url_full_size')
  String urlFullSize;
  @JsonKey(name: 'url_small_size')
  String urlSmallSize;

  Pixelfrom({
    this.title,
    required this.id,
    required this.filename,
    required  this.urlFullSize,
    required this.urlSmallSize
});


  factory Pixelfrom.fromJson(Map<String, dynamic> json) =>
      _$PixelfromFromJson(json);

  Map<String, dynamic> toJson() => _$PixelfromToJson(this);
}
