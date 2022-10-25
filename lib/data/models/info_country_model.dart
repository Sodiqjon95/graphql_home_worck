import 'package:json_annotation/json_annotation.dart';

part 'info_country_model.g.dart';

//  {
//             "name": "Russia",
//             "native": "Россия",
//             "capital": "Moscow",
//             "emoji": "🇷🇺",
//             "currency": "RUB",
//         }


@JsonSerializable()
class InfoCountryModel {
  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "native")
  String native;

  @JsonKey(defaultValue: "", name: "capital")
  String capital;

  @JsonKey(defaultValue: "", name: "emoji")
  String emoji;

  @JsonKey(defaultValue: "", name: "currency")
  String currency;

  InfoCountryModel({
    required this.name,
    required this.emoji,
    required this.capital,
    required this.currency,
    required this.native,
  });

  factory InfoCountryModel.fromJson(Map<String, dynamic> json) => _$InfoCountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoCountryModelToJson(this);
}
