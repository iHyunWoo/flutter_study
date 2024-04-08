import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/screen/story_screen.dart';

import '../model/StroyModel.dart';
import '../util/constants.dart';
import '../widget/HomeFeedItem.dart';
import '../widget/HomeStoryItem.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  final _database = FirebaseDatabase.instance;
  List<Story> _stories = [];

  @override
  void initState() {
    super.initState();
    _loadStories();
  }

  void _loadStories() async {
    Future.delayed(Duration.zero, () async {
      final List<dynamic> storyData =
          (await _database.ref().child('story').once()).snapshot.value
              as List<dynamic>;

      List<Story> newStroies = [];
      List<StoryModel> mappedStory = storyData
          .where((element) => element != null)
          .map((e) => StoryModel.fromJson(e))
          .toList();

      for (var value in mappedStory) {
        StoryModel story = value as StoryModel;
        String userId = story.userId;
        String imageUrl = story.imageUrl;
        String userName = await _getUserName(userId);

        newStroies.add(Story(userName: userName, imageUrl: imageUrl));
      }
      ;

      if (!newStroies.isEmpty) {
        setState(() {
          _stories = newStroies;
        });
      }
    });
  }

  Future<String> _getUserName(String userId) async {
    return (await _database
            .ref()
            .child('users')
            .child(userId)
            .child('userName')
            .once())
        .snapshot
        .value
        .toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _appBar(),
            _storyPart(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
            ),
            _feetPart()
          ],
        ),
      ),
    );
  }

  SliverList _feetPart() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: HomeFeedItem(),
        );
      }, childCount: 10),
    );
  }

  SliverToBoxAdapter _storyPart() {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        child: ListView.builder(
          itemCount: _stories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StoryScreen(story: _stories[index])));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: HomeStoryItem(
                  story: _stories[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_outline,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.send_outlined,
          ),
        ),
      ],
      title: Row(
        children: [
          SvgPicture.asset('${Constants.imageBasePath}/InstagramLogo.svg'),
        ],
      ),
    );
  }
}
