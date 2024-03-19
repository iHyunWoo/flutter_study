import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../util/constants.dart';
import '../widget/HomeFeedItem.dart';
import '../widget/HomeStoryItem.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
                  SvgPicture.asset(
                      '${Constants.imageBasePath}/InstagramLogo.svg'),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: HomeStoryItem(),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: HomeFeedItem(),
                );
              }, childCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
