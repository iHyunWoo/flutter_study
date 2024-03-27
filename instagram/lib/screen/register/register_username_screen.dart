import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constants.dart';
import '../../widget/login_textfield.dart';

class RegisterUsernameScreen extends StatelessWidget {
  const RegisterUsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "사용자 이름 만들기",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "새 계정에 사용할 사용자 이름을 선택하세요. 나중에 언제든지 변경할 수 있습니다.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              LoginTextField(
                controller: usernameController,
                placeHolder: "사용자 이름",
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString("userName", usernameController.text);
                        Navigator.pushNamed(context, '/register/complete');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        '다음',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
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
        Container(
          height: 1,
          color: Constants.borderColor,
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
