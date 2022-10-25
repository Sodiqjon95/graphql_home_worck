// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoCountryModel _$InfoCountryModelFromJson(Map<String, dynamic> json) =>
    InfoCountryModel(
      name: json['name'] as String? ?? '',
      emoji: json['emoji'] as String? ?? '',
      capital: json['capital'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      native: json['native'] as String? ?? '',
    );

Map<String, dynamic> _$InfoCountryModelToJson(InfoCountryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'native': instance.native,
      'capital': instance.capital,
      'emoji': instance.emoji,
      'currency': instance.currency,
    };
