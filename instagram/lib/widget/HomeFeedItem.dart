import 'package:flutter/material.dart';

import '../util/constants.dart';

class HomeFeedItem extends StatelessWidget {
  const HomeFeedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        _top(),
        _feedImage(screenWidth),
        _iconButtons(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "좋아요 123,456개",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "i_am_shiba",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "안녕하세요~ 반갑습니다~~",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "댓글 123개 모두 보기",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _iconButtons() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_outline,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chat_bubble_outline,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.send_outlined),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.bookmark_border_outlined,
          ),
        )
      ],
    );
  }

  Padding _top() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              '${Constants.imageBasePath}/shiba.jpg',
              fit: BoxFit.cover,
              width: 35,
              height: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'i_am_shiba',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }

  Container _feedImage(double screenWidth) {
    return Container(
      width: screenWidth,
      height: screenWidth,
      child: Image.asset(
        '${Constants.imageBasePath}/shiba.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
