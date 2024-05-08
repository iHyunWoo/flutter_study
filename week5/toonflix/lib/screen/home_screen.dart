import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/service/api_service.dart';
import 'package:toonflix/service/retrofit_api_service.dart';
import 'package:toonflix/widget/webtoon_widget.dart';

import '../model/webtoon_dto.dart';
import '../model/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();
  final Future<List<Webtoon>> webtoons = RetrofitApiService(Dio()).getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<Webtoon>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return WebtoonWidget(
          webtoon: webtoon,
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 20,
      ),
    );
  }
}
