import 'package:flutter/material.dart';

import '../../util/constants.dart';

class RegisterCompleteScreen extends StatelessWidget {
  const RegisterCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "ㅇㅇㅇ님으로\n가입하시겠어요?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "나중에 언제든지 사용자 이름을 변경할 수 있습니다."
              ),
              const Spacer(),
              _bottom(context),
            ],
          ),
        ),
      ),
    );
  }

  Column _bottom(BuildContext context) {
    return Column(
      children: [
        Text(
          "저희 서비스를 이용하는 사람이 회원님의 연락처 정보를 Instagram에 업로드했을 수도 있습니다. 더 알아보기",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Constants.lightGreyTextColor,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 1,
          color: Constants.borderColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register/password');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  '가입하기',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('이미 계정이 있으신가요?'),
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/login'));
              },
              child: Text("로그인"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ],
    );
  }
}
