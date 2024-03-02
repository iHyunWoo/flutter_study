import 'package:flutter/material.dart';
import 'package:toonflix/model/webtoon_model.dart';
import 'package:toonflix/screen/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final WebtoonModel webtoon;

  const Webtoon({super.key, required this.webtoon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(webtoon: webtoon),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          // Image.network(webtoon.thumb),
          Hero(
            tag: webtoon.id,
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                webtoon.thumb,
                headers: const {
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
