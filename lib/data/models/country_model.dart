import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

// {
// "code": "AD",
// "name": "Andorra",
// "emoji": "🇦🇩"
// },

@JsonSerializable()
class CountryModel {
  @JsonKey(defaultValue: "", name: "code")
  String code;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "emoji")
  String emoji;

  CountryModel({
    required this.emoji,
    required this.name,
    required this.code,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
