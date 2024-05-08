// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webtoon_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Webtoon _$WebtoonFromJson(Map<String, dynamic> json) => Webtoon(
      title: json['title'] as String,
      thumb: json['thumb'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$WebtoonToJson(Webtoon instance) => <String, dynamic>{
      'title': instance.title,
      'thumb': instance.thumb,
      'id': instance.id,
    };

WebtoonDetail _$WebtoonDetailFromJson(Map<String, dynamic> json) =>
    WebtoonDetail(
      title: json['title'] as String,
      about: json['about'] as String,
      genre: json['genre'] as String,
      age: json['age'] as String,
    );

Map<String, dynamic> _$WebtoonDetailToJson(WebtoonDetail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'about': instance.about,
      'genre': instance.genre,
      'age': instance.age,
    };

WebtoonEpisode _$WebtoonEpisodeFromJson(Map<String, dynamic> json) =>
    WebtoonEpisode(
      id: json['id'] as String,
      title: json['title'] as String,
      rating: json['rating'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$WebtoonEpisodeToJson(WebtoonEpisode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'rating': instance.rating,
      'date': instance.date,
    };
