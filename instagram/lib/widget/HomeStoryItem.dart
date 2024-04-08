import 'package:flutter/material.dart';

import '../model/StroyModel.dart';
import '../util/constants.dart';

class HomeStoryItem extends StatefulWidget {
  final Story story;

  const HomeStoryItem({super.key, required this.story});

  @override
  State<HomeStoryItem> createState() => _HomeStoryItemState();
}

class _HomeStoryItemState extends State<HomeStoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.pink,
                      Colors.red,
                      Colors.orange,
                      Colors.yellow
                    ],
                  ),
                ),
              ),
              ClipOval(
                child: Image.asset(
                  '${Constants.imageBasePath}/person.jpg',
                  fit: BoxFit.cover,
                  width: 75,
                  height: 75,
                ),
                // child: Image.network(
                //   widget.story.imageUrl,
                //   fit: BoxFit.cover,
                //   width: 75,
                //   height: 75,
                // ),
              ),
            ],
          ),
          Text(
            widget.story.userName,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
