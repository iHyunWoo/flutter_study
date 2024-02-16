import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index * 2,
  );

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollViewScreen',
      body: renderPhysics(),
    );
  }

  // 1. 기본 SingleChildScrollView
  Widget renderSimple() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: rainbowColors.map((e) => renderContainer(color: e)).toList(),
      ),
    );
  }

  // 2. 위젯이 잘리지 않도록
  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.hardEdge,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  // 3. 화면을 넘어가지 않아도 스크롤 가능하게
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      // physics: NeverScrollableScrollPhysics(), 기본 값 화면 안넘어가면 스크롤 안됨
      physics: AlwaysScrollableScrollPhysics(), // 항상 스크롤
      child: Column(
        children: [renderContainer(color: Colors.black)],
      ),
    );
  }

  // 4
  // 여러가지 physics 정리
  Widget renderPhysics() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics - 스크롤 안됨
      // AlwaysScrollableScrollPhysics - 스크롤 됨
      // BouncingScrollPhysics - iOS 스타일
      // ClampingScrollPhysics - Android 스타일
      physics: BouncingScrollPhysics(),
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainer(
                color: e,
              ),
            )
            .toList(),
      ),
    );
  }

  // 5
  // SingleChildScrollView 퍼포먼스
  Widget renderPerformance(){
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map(
              (e) => renderContainer(
            color: rainbowColors[e % rainbowColors.length],
            index: e,
          ),
        )
            .toList(),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {

    return Container(
      height: 300,
      color: color,
    );
  }
}
