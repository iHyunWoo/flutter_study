import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({super.key});

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "ReorderableListViewScreen",
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        itemCount: 100,
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }

          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        },
      ),
    );
  }

  Widget renderDefault() {
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          /*
            [red, orange, yellow]란 배열이 있다고 가정
            그러면 인덱스는 당연히 [0, 1, 2]가 될 것임

            이때, 만약 red를 yellow다음으로 옮기고 싶다면
            red: 0 oldIndex -> 3 newIndex

            하지만 실제 정렬 결과는
            [orange, yellow, red] 당연히 인덱스도 [0, 1, 2]

            또 다른 예시로
            [red, orange, yellow]에서 이번엔 yellow를 맨 앞으로 옮기고 싶다고 가정
            yellow: 2 oldIndex -> 0 newIndex
             */

          // 따라서 index를 뒤로(크게)하고 싶다면 -> newIndex -= 1
          // 앞으로 할 때는 상관없음
          // index 산정은 반드시 실제로 swap하기 전에 수행해야 함
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }

          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        });
      },
      children: numbers
          .map(
            (e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ),
          )
          .toList(),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);

    return Container(
      key: Key(index.toString()),
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30),
        ),
      ),
    );
  }
}
