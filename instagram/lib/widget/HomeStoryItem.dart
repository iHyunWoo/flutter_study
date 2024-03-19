import 'package:flutter/material.dart';

import '../util/constants.dart';

class HomeStoryItem extends StatelessWidget {
  const HomeStoryItem({super.key});

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
                  '${Constants.imageBasePath}/shiba.jpg',
                  fit: BoxFit.cover,
                  width: 75,
                  height: 75,
                ),
              ),
            ],
          ),
          Text(
            "i_am_shiba",
            style: TextStyle(
                fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}