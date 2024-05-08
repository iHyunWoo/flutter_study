import 'package:json_annotation/json_annotation.dart';

part 'webtoon_dto.g.dart';

@JsonSerializable()
class Webtoon {
  final String title, thumb, id;

  Webtoon({
    required this.title,
    required this.thumb,
    required this.id
  });

  factory Webtoon.fromJson(Map<String, dynamic> json) => _$WebtoonFromJson(json);
  Map<String, dynamic> toJson() => _$WebtoonToJson(this);
}

@JsonSerializable()
class WebtoonDetail {
  final String title, about, genre, age;

  WebtoonDetail({
    required this.title,
    required this.about,
    required this.genre,
    required this.age
  });

  factory WebtoonDetail.fromJson(Map<String, dynamic> json) => _$WebtoonDetailFromJson(json);
  Map<String, dynamic> toJson() => _$WebtoonDetailToJson(this);
}

@JsonSerializable()
class WebtoonEpisode {
  final String id, title, rating, date;

  WebtoonEpisode({
    required this.id,
    required this.title,
    required this.rating,
    required this.date,
  });

  factory WebtoonEpisode.fromJson(Map<String, dynamic> json) => _$WebtoonEpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$WebtoonEpisodeToJson(this);
}