import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("버튼"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.black,
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    // Material State
                    //
                    // hoverd - 호버링 상태(마우스 커서를 올려 놓은 상태, 모바일x)
                    // focused - 포커스 됐을 때(텍스트 필드)
                    // pressed - 눌렀을 떄
                    // dragged - 드래그 됐을 떄
                    // selected - 선택 됐을 때(체크박스, 라디오 버튼 등)
                    // scrollUnder - 스크롤 돼서 다른 컴포넌트 밑으로 스크롤 됐을 떄
                    // disabled - 비활성화 됐을 때
                    // error - 에러 상태(텍스트 필드)

                    if (states.contains(MaterialState.pressed)) {
                      return Colors.white;
                    }

                    return Colors.red;
                  },
                ),
                padding: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                    if(states.contains(MaterialState.pressed)) {
                      return EdgeInsets.all(50.0);
                    }

                    return EdgeInsets.all(20.0);
                  },
                ),
              ),
              child: Text("ButtonStyle"),
            ),
            ElevatedButton(
              // 약간 3D 느낌
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.black,
                shadowColor: Colors.green,
                elevation: 10.0,  // 얼마나 앞(Z)으로 나올 것인지
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
                padding: EdgeInsets.all(32.0),
                side: BorderSide(
                  color: Colors.black,
                  width: 4.0,
                ),
              ),
              child: Text("ElevatedButton"),
            ),
            OutlinedButton(
              // 테두리만 있는 버튼
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.green,
              ),
              child: Text("OutlinedButton"),
            ),
            TextButton(
              // 그냥 텍스트만 있는 버튼
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.brown,
              ),
              child: Text("TextButton"),
            ),
          ],
        ),
      ),
    );
  }
}
