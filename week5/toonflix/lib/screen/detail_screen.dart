import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/model/webtoon_detail_model.dart';
import 'package:toonflix/model/webtoon_episode_model.dart';
import 'package:toonflix/model/webtoon_model.dart';
import 'package:toonflix/service/api_service.dart';
import 'package:toonflix/widget/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final WebtoonModel webtoon;

  const DetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.webtoon.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []);
    }
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if(likedToons != null) {
      if(isLiked) {
        likedToons.remove(widget.webtoon.id);
      } else {
        likedToons.add(widget.webtoon.id);
      }

      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.webtoon.id);
    episodes = ApiService.getLatesetEpisodesById(widget.webtoon.id);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.webtoon.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
        actions: [
          IconButton(
            onPressed: onHeartTap,
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_outline_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.webtoon.id,
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
                        widget.webtoon.thumb,
                        headers: const {
                          'Referer': 'https://comic.naver.com',
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text("...");
                },
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                              episode: episode, webtoonId: widget.webtoon.id)
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
