import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/model/webtoon_detail_model.dart';
import 'package:toonflix/model/webtoon_episode_model.dart';
import 'package:toonflix/model/webtoon_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  static final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static final String today = "today";



  static Future<List<WebtoonModel>> getTodaysToons() async {
    final dio = Dio();
    List<WebtoonModel> webtoonInstances = [];
    final url = '$baseUrl/$today';
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = response.data;
      for(var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }

    throw Error();


  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }

    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatesetEpisodesById(String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for(var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }

      return episodesInstances;
    }

    throw Error();
  }
}