import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/screen/home_main_screen.dart';
import 'package:instagram/screen/profile/profile_main_screen.dart';

import '../util/constants.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentIndex = 0;

  final List<Widget> bodyItem = [
    const HomeMainScreen(),
    const Text("Search"),
    const Text("Reels"),
    const Text("Shopping"),
    const ProfileMainScreen(),
  ];

  // 각 아이템에 대한 일반 이미지와 선택된 아이템의 이미지를 정의합니다.
  final List<String> unselectedImages = [
    '${Constants.imageBasePath}/TabBar/Home.png',
    '${Constants.imageBasePath}/TabBar/Search.png',
    '${Constants.imageBasePath}/TabBar/Reels.png',
    '${Constants.imageBasePath}/TabBar/Shopping.png',
    '${Constants.imageBasePath}/TabBar/DefaultProfile.png',
  ];

  final List<String> selectedImages = [
    '${Constants.imageBasePath}/TabBar/FilledHome.png',
    '${Constants.imageBasePath}/TabBar/FilledSearch.png',
    '${Constants.imageBasePath}/TabBar/FilledReels.png',
    '${Constants.imageBasePath}/TabBar/FilledShop.png',
    '${Constants.imageBasePath}/TabBar/FilledDefaultProfile.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          //현재 index 변수에 저장
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          //BottomNavi item list
          items: List.generate(
            5,
            (index) => BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  index == currentIndex ? selectedImages[index] : unselectedImages[index],
                ),
              ),
              label: '',
            ),
          ),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),

        //List item index로 Body 변경
        body: Center(
          child: bodyItem.elementAt(currentIndex),
        ));
  }
}
